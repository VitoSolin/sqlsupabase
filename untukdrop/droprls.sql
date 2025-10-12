DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT polname, polrelid::regclass AS table_name
        FROM pg_policy
    LOOP
        EXECUTE format('DROP POLICY IF EXISTS %I ON %s;', r.polname, r.table_name);
    END LOOP;
END;
$$;
