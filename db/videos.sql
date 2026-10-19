-- ============================================================
--  NudiMap — Vidéos courtes dans les observations (réservé admin)
--  Les déposants peuvent joindre UNE courte vidéo (max ~5 s) à leur
--  observation. Elle n'est visible QUE dans l'espace admin (pour
--  l'identification), avec un bouton « Télécharger ».
--  Les vidéos sont stockées dans le bucket existant « photos »,
--  dans un dossier « vid/ » — rien d'autre à créer.
--  À coller dans Supabase → SQL Editor → RUN (une seule fois).
-- ============================================================

-- 1) Nouvelle colonne pour les URLs de vidéos (comme « photos »).
alter table public.observations
  add column if not exists videos jsonb not null default '[]'::jsonb;

-- 2) Autoriser des fichiers plus lourds dans le stockage (une vidéo
--    pèse bien plus qu'une photo) — on monte la limite du bucket
--    « photos » à 50 Mo. (Sans effet si elle est déjà ≥ 50 Mo.)
update storage.buckets
  set file_size_limit = 52428800   -- 50 Mo
  where id = 'photos';
