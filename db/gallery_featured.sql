-- ============================================================
--  NudiMap — Galerie choisie : les experts sélectionnent
--  leurs coups de cœur (bouton ⭐ dans l'admin sur une
--  observation validée). Une colonne marque la date d'ajout.
--  À coller dans Supabase → SQL Editor → RUN (une seule fois).
-- ============================================================

-- 1) Colonne : date d'ajout à la galerie (NULL = pas dans la galerie)
alter table public.observations
  add column if not exists featured_at timestamptz;

-- 2) La galerie est PUBLIQUE → tout le monde doit pouvoir LIRE ce champ
--    (l'écriture reste réservée aux experts connectés par la règle RLS existante).
grant select (featured_at) on public.observations to anon, authenticated;
