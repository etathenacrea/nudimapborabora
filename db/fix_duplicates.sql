-- ============================================================
--  NudiMap — Fusion du doublon « Caloria indica »
--  (déjà exécuté le 2026-07-27 — conservé pour historique)
--  À coller dans Supabase → SQL Editor → RUN si besoin de rejouer.
-- ============================================================

-- CALORIA INDICA (2 fiches pour la même espèce)
--   On GARDE la fiche complète « flabellina-exopata »
--     (description, anecdote, taille, photo de référence).
--   On rattache les observations de SylvieO — qui étaient sur le
--     doublon — à cette fiche (rien n'est perdu : SylvieO reste
--     créditée comme observatrice).
--   Puis on supprime le doublon « caloria-indica ».
update public.observations
   set species_id = 'flabellina-exopata'
 where species_id = 'caloria-indica';

delete from public.species
 where id = 'caloria-indica';

-- NOTE — Pseudoceros :
--   Les fiches « Pseudoceros » ne sont PAS des doublons : ce sont
--   des vers plats (genre Pseudoceros) dont le nom d'espèce n'est
--   pas encore trouvé. Pour les distinguer sans qu'elles se
--   ressemblent, les nommer « Pseudoceros sp1 », « Pseudoceros sp2 »…
--   (même logique que sp1/sp2/sp3). NE PAS les supprimer.

-- ------------------------------------------------------------
--  VÉRIFICATION (doit renvoyer 0 ligne = plus de doublon)
-- ------------------------------------------------------------
select sci, count(*) as nb
  from public.species
 group by sci
having count(*) > 1;
