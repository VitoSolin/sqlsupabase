DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT indexname
        FROM pg_indexes
        WHERE schemaname='public'
    LOOP
        EXECUTE format('DROP INDEX IF EXISTS %I;', r.indexname);
    END LOOP;
END;
$$;
