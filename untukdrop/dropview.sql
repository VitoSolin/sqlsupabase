DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT table_name
        FROM information_schema.views
        WHERE table_schema='public'
    LOOP
        EXECUTE format('DROP VIEW IF EXISTS %I CASCADE;', r.table_name);
    END LOOP;
END;
$$;

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT matviewname
        FROM pg_matviews
        WHERE schemaname='public'
    LOOP
        EXECUTE format('DROP MATERIALIZED VIEW IF EXISTS %I CASCADE;', r.matviewname);
    END LOOP;
END;
$$;
