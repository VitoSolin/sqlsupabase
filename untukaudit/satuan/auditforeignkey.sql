select
  conrelid::regclass as table_name,
  conname as constraint_name,
  pg_get_constraintdef(c.oid) as definition
from pg_constraint c
join pg_namespace n on n.oid = c.connamespace
where contype = 'f'
order by conrelid::regclass::text;
