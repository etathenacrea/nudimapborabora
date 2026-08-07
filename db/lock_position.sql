-- ============================================================
--  NudiMap — Le PROPRIÉTAIRE (Justine) peut déplacer le point
--  d'une observation. Verrou serveur : personne d'autre ne peut
--  changer la position (lat/lng), même via des outils.
--  À coller dans Supabase → SQL Editor → RUN (une seule fois).
-- ============================================================

-- 1) Fonction owner-only : change la position si le jeton porte owner=true
create or replace function public.set_observation_position(p_id uuid, p_lat double precision, p_lng double precision)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare
  n int;
  claims jsonb := coalesce(current_setting('request.jwt.claims', true), '{}')::jsonb;
begin
  if not coalesce((claims -> 'user_metadata' ->> 'owner')::boolean, false) then
    return false;
  end if;
  update public.observations set lat = p_lat, lng = p_lng where id = p_id;
  get diagnostics n = row_count;
  return n > 0;
end;
$$;
grant execute on function public.set_observation_position(uuid, double precision, double precision) to authenticated;

-- 2) On étend le verrou existant : il bloque désormais aussi tout changement
--    DIRECT de la position (lat/lng), pas seulement l'île. Les fonctions
--    sécurisées (owner ci-dessus, et la correction du déposant) restent permises.
create or replace function public.block_direct_island_change()
returns trigger
language plpgsql
as $$
begin
  if current_user in ('authenticated','anon') and (
        NEW.island is distinct from OLD.island
     or NEW.lat    is distinct from OLD.lat
     or NEW.lng    is distinct from OLD.lng
  ) then
    raise exception 'Changement d''île / position non autorisé (réservé au propriétaire).';
  end if;
  return NEW;
end;
$$;
-- Le trigger trg_block_island utilise déjà cette fonction (mise à jour ci-dessus).
