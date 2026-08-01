-- ============================================================
--  NudiMap — Donne à Justine le rôle « propriétaire » (owner)
--  Elle seule verra le sélecteur d'île sur la carte pour corriger
--  l'île d'une observation. À coller dans Supabase → SQL Editor → RUN.
-- ============================================================
update auth.users
   set raw_user_meta_data = coalesce(raw_user_meta_data, '{}'::jsonb) || '{"owner":true}'::jsonb
 where lower(email) = 'pro.justinecertain@gmail.com';

-- Vérif : doit afficher owner = true
select email, raw_user_meta_data->>'owner' as owner
  from auth.users
 where lower(email) = 'pro.justinecertain@gmail.com';
