-- ============================================================
-- NudiMap · stockage des photos d'observations (Étape 3)
-- À coller dans Supabase : SQL Editor → New query → Run
-- Crée un "bucket" public "photos" + autorise la lecture par tous
-- et le dépôt de photos par les déposants.
-- ============================================================

insert into storage.buckets (id, name, public)
values ('photos', 'photos', true)
on conflict (id) do nothing;

drop policy if exists "photos_read"   on storage.objects;
drop policy if exists "photos_upload" on storage.objects;

create policy "photos_read"   on storage.objects for select using (bucket_id = 'photos');
create policy "photos_upload" on storage.objects for insert with check (bucket_id = 'photos');
