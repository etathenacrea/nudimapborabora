-- ============================================================
--  NudiMap — Corrige les observations qui sont géographiquement
--  à Fakarava mais étiquetées ailleurs (ex. « Tahiti »).
--  La zone de coordonnées ci-dessous ne couvre QUE Fakarava
--  (exclut Tahiti/Moorea/Bora Bora et Rangiroa, tous plus à l'ouest).
--  À coller dans Supabase → SQL Editor → RUN.
-- ============================================================
update public.observations
   set island = 'Fakarava'
 where island <> 'Fakarava'
   and lat between -17.2 and -15.4
   and lng between -146.6 and -144.6;

-- Vérif : toutes les obs de la zone Fakarava doivent afficher island = Fakarava
select id, island, site, by_name
  from public.observations
 where lat between -17.2 and -15.4 and lng between -146.6 and -144.6
 order by site;
