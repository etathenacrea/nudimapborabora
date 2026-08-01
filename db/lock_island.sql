-- ============================================================
--  NudiMap — Verrou serveur : seul le PROPRIÉTAIRE (owner) peut
--  changer l'île d'une observation, même via des outils techniques.
--  À coller dans Supabase → SQL Editor → RUN (une seule fois).
-- ============================================================

-- 1) Fonction owner-only : vérifie le drapeau "owner" dans le jeton (JWT)
--    et applique le changement d'île. SECURITY DEFINER = passe le verrou.
create or replace function public.set_observation_island(p_id uuid, p_island text)
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
    return false;                      -- pas propriétaire → refus
  end if;
  update public.observations set island = p_island where id = p_id;
  get diagnostics n = row_count;
  return n > 0;
end;
$$;
grant execute on function public.set_observation_island(uuid, text) to authenticated;

-- 2) Verrou : interdit TOUT changement direct de la colonne "island" via l'API
--    (rôles anon / authenticated). Les fonctions sécurisées (owner ci-dessus,
--    et la correction du déposant edit_observation) s'exécutent en 'postgres'
--    et ne sont donc pas bloquées.
create or replace function public.block_direct_island_change()
returns trigger
language plpgsql
as $$
begin
  if NEW.island is distinct from OLD.island and current_user in ('authenticated','anon') then
    raise exception 'Changement d''île non autorisé (réservé au propriétaire).';
  end if;
  return NEW;
end;
$$;

drop trigger if exists trg_block_island on public.observations;
create trigger trg_block_island
  before update on public.observations
  for each row execute function public.block_direct_island_change();
