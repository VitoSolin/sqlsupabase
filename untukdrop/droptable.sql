DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema='public'
    LOOP
        EXECUTE format('DROP TABLE IF EXISTS %I CASCADE;', r.table_name);
    END LOOP;
END;
$$;
