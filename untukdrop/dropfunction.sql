DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT p.oid::regclass AS funcname
        FROM pg_proc p
        JOIN pg_namespace n ON p.pronamespace = n.oid
        WHERE n.nspname = 'public'
    LOOP
        EXECUTE format('DROP FUNCTION IF EXISTS %s CASCADE;', r.funcname);
    END LOOP;
END;
$$;
