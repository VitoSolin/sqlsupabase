select 
  event_object_table as table_name,
  trigger_name,
  action_timing,
  event_manipulation as event,
  action_statement as function_called
from information_schema.triggers
order by event_object_table;
