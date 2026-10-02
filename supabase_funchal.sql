-- FUNCHAL · estrutura da nuvem (mesmo modelo do Funchal)
-- Cole no SQL Editor do projeto Supabase da FUNCHAL e clique em Run.
create table if not exists public.funchal_registros (
  uid text not null,
  org text not null default 'FUNCHAL',
  store text not null,
  dados jsonb not null default '{}'::jsonb,
  deletado boolean not null default false,
  atualizado_em timestamptz not null default now(),
  primary key (org, store, uid)
);
create index if not exists funchal_registros_sync_idx on public.funchal_registros (org, atualizado_em);
alter table public.funchal_registros enable row level security;
drop policy if exists funchal_registros_acesso on public.funchal_registros;
create policy funchal_registros_acesso on public.funchal_registros for all using (true) with check (true);

insert into storage.buckets (id, name, public) values ('funchal-fotos', 'funchal-fotos', true)
on conflict (id) do update set public = true;
drop policy if exists funchal_fotos_ler on storage.objects;
drop policy if exists funchal_fotos_enviar on storage.objects;
drop policy if exists funchal_fotos_trocar on storage.objects;
drop policy if exists funchal_fotos_apagar on storage.objects;
create policy funchal_fotos_ler    on storage.objects for select using (bucket_id = 'funchal-fotos');
create policy funchal_fotos_enviar on storage.objects for insert with check (bucket_id = 'funchal-fotos');
create policy funchal_fotos_trocar on storage.objects for update using (bucket_id = 'funchal-fotos') with check (bucket_id = 'funchal-fotos');
create policy funchal_fotos_apagar on storage.objects for delete using (bucket_id = 'funchal-fotos');
