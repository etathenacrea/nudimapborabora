-- ============================================================
--  NudiMap — ❤️ Likes publics sur les photos de la galerie
--  + "Premier de la semaine" (photo la plus likée de la semaine).
--  Tout le monde (même non connecté) peut liker une fois par
--  appareil (client_id). Écriture UNIQUEMENT via les fonctions
--  sécurisées ci-dessous (pas d'accès direct à la table).
--  À coller dans Supabase → SQL Editor → RUN (une seule fois).
-- ============================================================

-- 1) Table des likes : 1 like par (photo, appareil).
create table if not exists public.photo_likes (
  observation_id uuid not null references public.observations(id) on delete cascade,
  client_id      text not null,
  created_at     timestamptz not null default now(),
  primary key (observation_id, client_id)
);
create index if not exists photo_likes_obs_idx on public.photo_likes(observation_id);

-- 2) RLS activé SANS règle anon/authenticated : la table n'est pas
--    accessible directement par l'API. Tout passe par les fonctions
--    SECURITY DEFINER ci-dessous (qui, elles, sont autorisées).
alter table public.photo_likes enable row level security;

-- 3) Ajouter / retirer un like pour un appareil. Renvoie {liked,total,week}.
create or replace function public.toggle_like(p_obs uuid, p_client text)
returns json
language plpgsql
security definer
set search_path = public
as $$
declare
  v_liked boolean;
  v_total int;
  v_week  int;
  v_start timestamptz := (date_trunc('week', (now() at time zone 'Pacific/Tahiti')) at time zone 'Pacific/Tahiti');
begin
  if p_client is null or length(p_client) < 8 or length(p_client) > 64 then
    raise exception 'client invalide';
  end if;
  if exists (select 1 from photo_likes where observation_id = p_obs and client_id = p_client) then
    delete from photo_likes where observation_id = p_obs and client_id = p_client;
    v_liked := false;
  else
    insert into photo_likes(observation_id, client_id) values (p_obs, p_client)
      on conflict do nothing;
    v_liked := true;
  end if;
  select count(*) into v_total from photo_likes where observation_id = p_obs;
  select count(*) into v_week  from photo_likes where observation_id = p_obs and created_at >= v_start;
  return json_build_object('liked', v_liked, 'total', v_total, 'week', v_week);
end;
$$;
grant execute on function public.toggle_like(uuid, text) to anon, authenticated;

-- 4) Toutes les données de likes pour la galerie : total, likes de LA
--    SEMAINE (lundi→dimanche, heure de Tahiti), et "mine" (cet appareil).
create or replace function public.gallery_likes(p_client text)
returns table(observation_id uuid, total bigint, week bigint, mine boolean)
language sql
security definer
set search_path = public
as $$
  select l.observation_id,
         count(*)::bigint,
         count(*) filter (
           where l.created_at >= (date_trunc('week', (now() at time zone 'Pacific/Tahiti')) at time zone 'Pacific/Tahiti')
         )::bigint,
         coalesce(bool_or(l.client_id = p_client), false)
  from public.photo_likes l
  group by l.observation_id;
$$;
grant execute on function public.gallery_likes(text) to anon, authenticated;
