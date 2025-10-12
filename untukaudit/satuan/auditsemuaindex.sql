select 
  schemaname,
  tablename,
  indexname,
  indexdef
from pg_indexes
where schemaname not in ('pg_catalog', 'information_schema')
order by schemaname, tablename;
