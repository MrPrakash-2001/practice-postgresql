-- Create audit_log table
CREATE TABLE audit_log (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    table_name TEXT,
    operation TEXT,
    row_data JSONB,
    changed_at TIMESTAMP DEFAULT now()
);

-- Trigger function to log INSERTs on posts
CREATE OR REPLACE FUNCTION log_post_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_log(table_name, operation, row_data)
    VALUES('posts', 'INSERT', row_to_json(NEW));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger function to log DELETEs on posts
CREATE OR REPLACE FUNCTION log_post_delete()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_log(table_name, operation, row_data)
    VALUES('posts', 'DELETE', row_to_json(OLD));
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Attach trigger to posts INSERT
CREATE TRIGGER trigger_log_post_insert
AFTER INSERT ON posts
FOR EACH ROW
EXECUTE FUNCTION log_post_insert();

-- Attach trigger to posts DELETE
CREATE TRIGGER trigger_log_post_delete
AFTER DELETE ON posts
FOR EACH ROW
EXECUTE FUNCTION log_post_delete();

-- Try an INSERT
INSERT INTO posts(user_id, title, content, tags, metadata)
VALUES((SELECT id FROM users LIMIT 1), 'Trigger Test', 'This post should be logged', ARRAY['trigger'], '{"logged": true}');

-- Try a DELETE
DELETE FROM posts
WHERE title = 'Trigger Test';

-- View audit log
SELECT * FROM audit_log;



-- WE CAN HANDLE EVERYTHING IN SINGLE FUNCTION
CREATE OR REPLACE FUNCTION log_post_changes()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO audit_log(table_name, operation, row_data)
        VALUES (TG_TABLE_NAME, TG_OP, row_to_json(NEW));

        RETURN NEW;

    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO audit_log(table_name, operation, row_data)
        VALUES (TG_TABLE_NAME, TG_OP, jsonb_build_object(
            'old', row_to_json(OLD),
            'new', row_to_json(NEW)
        ));

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO audit_log(table_name, operation, row_data)
        VALUES (TG_TABLE_NAME, TG_OP, row_to_json(OLD));

        RETURN OLD;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


-- Add Trigger

CREATE TRIGGER trigger_log_post_changes
AFTER INSERT OR UPDATE OR DELETE ON posts
FOR EACH ROW
EXECUTE FUNCTION log_post_changes();
