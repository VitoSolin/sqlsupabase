DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT extname
        FROM pg_extension
    LOOP
        EXECUTE format('DROP EXTENSION IF EXISTS %I CASCADE;', r.extname);
    END LOOP;
END;
$$;
