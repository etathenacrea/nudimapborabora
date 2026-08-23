-- ============================================================
--  NudiMap — "Mes photos" : un observateur peut revoir la grille
--  des photos qu'il a déposées, À CONDITION de fournir le bon
--  nom ET le bon email (vérifiés côté serveur). Lecture seule :
--  aucune suppression, aucune info de lieu / profondeur / email
--  n'est renvoyée. Sert surtout à éviter les doublons.
--  À coller dans Supabase → SQL Editor → RUN (une seule fois).
-- ============================================================

create or replace function public.my_photos(p_name text, p_email text)
returns table(id uuid, photos jsonb, species_id text, proposed_name text, status text)
language sql
security definer
set search_path = public
as $$
  select o.id, to_jsonb(o.photos), o.species_id, o.proposed_name, o.status
  from public.observations o
  where o.status <> 'rejected'
    and length(coalesce(trim(p_email), '')) >= 3
    and lower(trim(coalesce(o.by_name, '')))  = lower(trim(coalesce(p_name, '')))
    and lower(trim(coalesce(o.by_email, ''))) = lower(trim(p_email))
  order by o.created_at desc nulls last;
$$;

-- Accessible à tout le monde : la vérification nom+email est DANS la fonction,
-- donc on ne renvoie les photos qu'à la bonne personne (et jamais l'email).
grant execute on function public.my_photos(text, text) to anon, authenticated;
