-- ============================================================
--  NudiMap — Restauration du ver plat supprimé par erreur
--  (l'ancienne fiche « identification-en-cours-2 » : un Pseudoceros
--   noir & blanc à pointes orange, distinct de l'autre).
--  Sa photo est toujours dans le stockage → on recrée la fiche.
--  À coller dans Supabase → SQL Editor → RUN.
-- ============================================================

-- 1) On recrée le ver plat noir & blanc (nommé « Pseudoceros sp2 »
--    en attendant son vrai nom d'espèce).
insert into public.species
  (id, sci, common_name, classification, family, day_night, rarity, size, description, note, photo)
values
  ('pseudoceros-sp2', 'Pseudoceros sp2', '', 'Ver plat', 'Pseudocerotidae',
   '', 0, '', '["Identification en cours"]'::jsonb, '',
   'https://hlpqqixkwvywekuutmnu.supabase.co/storage/v1/object/public/photos/obs/1784921084064-0-ck9v4i.jpg');

-- 2) Pour que la paire soit claire, on renomme l'autre (le ver plat
--    clair/orange) en « Pseudoceros sp1 ». (Facultatif : tu peux leur
--    donner leur vrai nom plus tard dans Admin → Bibliothèque → Modifier.)
update public.species
   set sci = 'Pseudoceros sp1'
 where id = 'identification-en-cours';

-- Vérif : les deux vers plats, distincts
select id, sci, photo from public.species where classification = 'Ver plat' order by sci;
