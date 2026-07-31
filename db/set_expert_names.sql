-- ============================================================
--  NudiMap — Enregistre le prénom affiché de chaque expert
--  dans son compte Supabase (metadata "name").
--  Objectif : pouvoir retirer les emails du code source.
--  À coller dans Supabase → SQL Editor → RUN (une seule fois).
-- ============================================================

update auth.users u
   set raw_user_meta_data = coalesce(u.raw_user_meta_data, '{}'::jsonb)
                            || jsonb_build_object('name', v.name)
  from (values
    ('pro.justinecertain@gmail.com', 'Justine'),
    ('alexandre.tayale@gmail.com',   'Alexandre'),
    ('pauline.bosserelle@gmail.com', 'Pauline Bosserelle'),
    ('vincentdondon@orange.fr',      'Vincent'),
    ('alysee.drb@gmail.com',         'Alizée')
  ) as v(email, name)
 where lower(u.email) = v.email;

-- Vérif : chaque expert doit afficher son prénom
select email, raw_user_meta_data->>'name' as prenom
  from auth.users
 order by email;
