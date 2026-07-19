-- ============================================================
-- NudiMap · structure de la base de données (Étape 2)
-- À coller dans Supabase : SQL Editor → New query → tout coller → Run
-- Ré-exécutable sans risque (ne casse rien si relancé).
-- ============================================================

-- 1) Bibliothèque d'espèces
create table if not exists public.species (
  id             text primary key,
  sci            text not null,
  common_name    text default '',
  classification text default '',
  family         text default '',
  day_night      text default '',
  rarity         int  default 0,
  size           text default '',
  description    jsonb default '[]'::jsonb,   -- liste de points (puces)
  note           text default '',
  photo          text default '',
  created_at     timestamptz default now()
);

-- 2) Observations déposées
create table if not exists public.observations (
  id            uuid primary key default gen_random_uuid(),
  species_id    text references public.species(id) on delete set null,
  proposed_name text default '',                 -- proposition de nom du déposant
  photos        jsonb default '[]'::jsonb,       -- liste d'URLs de photos
  env           text default '',
  island        text default '',                 -- île (îles de la Société d'abord)
  site          text default '',
  lat           double precision,
  lng           double precision,
  obs_date      date,
  obs_time      text default '',
  depth         int,
  note          text default '',
  by_name       text default '',
  by_email      text default '',
  by_phone      text default '',
  status        text default 'pending',          -- pending | validated | rejected
  juvenile      boolean default false,
  expert_note   text default '',
  validated_by  text default '',
  reason        text default '',                 -- motif de refus
  outcome       text,                            -- validated | rejected | null
  outcome_at    timestamptz,
  created_at    timestamptz default now()
);

-- 3) Sécurité (Row Level Security)
--    Lecture publique · dépôt d'observation public · écritures réservées aux experts connectés
alter table public.species      enable row level security;
alter table public.observations enable row level security;

drop policy if exists "species_read"   on public.species;
drop policy if exists "species_write"  on public.species;
drop policy if exists "obs_read"        on public.observations;
drop policy if exists "obs_insert"      on public.observations;
drop policy if exists "obs_update"      on public.observations;
drop policy if exists "obs_delete"      on public.observations;

-- Tout le monde peut LIRE
create policy "species_read" on public.species      for select using (true);
create policy "obs_read"     on public.observations for select using (true);

-- N'importe qui peut DÉPOSER une observation
create policy "obs_insert"   on public.observations for insert with check (true);

-- Seuls les experts CONNECTÉS gèrent la bibliothèque et valident/modifient/suppriment
create policy "species_write" on public.species      for all    to authenticated using (true) with check (true);
create policy "obs_update"    on public.observations for update to authenticated using (true) with check (true);
create policy "obs_delete"    on public.observations for delete to authenticated using (true);
