-- ============================================================
--  NudiMap — Le déposant peut corriger SON observation
--  tant qu'elle est « en attente » (avant validation).
--  Sécurité : une clé secrète (edit_token) générée à l'envoi et
--  gardée sur le téléphone du déposant ; seul celui qui l'a peut
--  corriger, et uniquement une observation encore en attente.
--  À coller dans Supabase → SQL Editor → RUN (une seule fois).
-- ============================================================

-- 1) Colonne : la clé secrète d'édition
alter table public.observations
  add column if not exists edit_token text;

-- 2) Fonction sécurisée (SECURITY DEFINER) : applique les corrections
--    seulement si l'id + la clé correspondent ET que c'est encore en attente.
--    Ne touche jamais au statut, au déposant ni à la validation.
create or replace function public.edit_observation(p_id uuid, p_token text, p_patch jsonb)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare n int;
begin
  if p_token is null or length(p_token) < 8 then
    return false;
  end if;
  update public.observations o set
    species_id    = case when p_patch ? 'species_id' then nullif(p_patch->>'species_id','') else o.species_id end,
    proposed_name = coalesce(p_patch->>'proposed_name', o.proposed_name),
    photos        = case when p_patch ? 'photos'   then p_patch->'photos'                    else o.photos end,
    env           = coalesce(p_patch->>'env', o.env),
    island        = coalesce(p_patch->>'island', o.island),
    site          = coalesce(p_patch->>'site', o.site),
    lat           = case when p_patch ? 'lat'      then (p_patch->>'lat')::double precision  else o.lat end,
    lng           = case when p_patch ? 'lng'      then (p_patch->>'lng')::double precision  else o.lng end,
    obs_date      = case when p_patch ? 'obs_date' then (p_patch->>'obs_date')::date         else o.obs_date end,
    obs_time      = coalesce(p_patch->>'obs_time', o.obs_time),
    depth         = case when p_patch ? 'depth'    then (p_patch->>'depth')::int             else o.depth end,
    note          = coalesce(p_patch->>'note', o.note)
  where o.id = p_id
    and o.edit_token = p_token
    and o.status = 'pending';
  get diagnostics n = row_count;
  return n > 0;
end;
$$;

-- 3) Autoriser les déposants (anonymes) et les experts à appeler la fonction
grant execute on function public.edit_observation(uuid, text, jsonb) to anon, authenticated;
