select 
  table_schema,
  table_name,
  view_definition
from information_schema.views
where table_schema not in ('pg_catalog', 'information_schema')
order by table_schema, table_name;
