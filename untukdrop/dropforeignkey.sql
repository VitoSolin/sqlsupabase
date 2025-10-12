-- drop semua FK di schema public
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT conrelid::regclass AS table_name, conname AS fk_name
        FROM pg_constraint
        WHERE contype = 'f'
    LOOP
        EXECUTE format('ALTER TABLE %s DROP CONSTRAINT %I;', r.table_name, r.fk_name);
    END LOOP;
END;
$$;
