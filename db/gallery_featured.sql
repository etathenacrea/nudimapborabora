-- ============================================================
--  NudiMap — Galerie choisie : les experts sélectionnent
--  leurs coups de cœur (bouton ⭐ dans l'admin sur une
--  observation validée). Une colonne marque la date d'ajout.
--  À coller dans Supabase → SQL Editor → RUN (une seule fois).
-- ============================================================

-- 1) Colonnes : date d'ajout à la galerie (NULL = pas dedans) + photo choisie
--    (quand une observation a plusieurs photos, on garde l'URL de celle retenue)
alter table public.observations
  add column if not exists featured_at    timestamptz,
  add column if not exists featured_photo text;

-- 2) La galerie est PUBLIQUE → tout le monde doit pouvoir LIRE ces champs
--    (l'écriture reste réservée aux experts connectés par la règle RLS existante).
grant select (featured_at, featured_photo) on public.observations to anon, authenticated;
