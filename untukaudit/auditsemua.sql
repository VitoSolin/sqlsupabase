select 'table' as type, table_name as name from information_schema.tables where table_schema='public'
union all
select 'view', table_name from information_schema.views where table_schema='public'
union all
select 'function', routine_name from information_schema.routines where specific_schema='public'
union all
select 'trigger', trigger_name from information_schema.triggers
union all
select 'policy', polname from pg_policy
order by type, name;
