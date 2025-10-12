select 
  pol.polname as policy_name,
  polschem.nspname as schema_name,
  polrel.relname as table_name,
  polcmd as command,
  pol.permissive,
  pol.qual,
  pol.with_check
from pg_policy pol
join pg_class polrel on polrel.oid = pol.polrelid
join pg_namespace polschem on polschem.oid = polrel.relnamespace
order by polschem.nspname, polrel.relname;
