-- Final Project: SaaS Multi-Tenant DB Schema

-- 1️⃣ Tenants table
CREATE TABLE tenants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2️⃣ Users table with tenant association
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id UUID REFERENCES tenants(id) ON DELETE CASCADE,
    username TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3️⃣ Projects table scoped by tenant
CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id UUID REFERENCES tenants(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4️⃣ Enable Row-Level Security (RLS) for tenant isolation on projects
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;

CREATE POLICY tenant_isolation_policy ON projects
    FOR ALL
    USING (tenant_id = current_setting('app.current_tenant')::uuid);

-- 5️⃣ Function to set tenant context (simulate app user)
CREATE OR REPLACE FUNCTION set_tenant_context(tenant UUID)
RETURNS void LANGUAGE plpgsql AS $$
BEGIN
    PERFORM set_config('app.current_tenant', tenant::text, false);
END;
$$;

-- 6️⃣ Sample insert with tenant context
-- Set tenant before running queries
-- SELECT set_tenant_context('some-tenant-uuid');

-- INSERT INTO projects (tenant_id, name, description)
-- VALUES (current_setting('app.current_tenant')::uuid, 'Project A', 'Description');

-- 7️⃣ Index on tenant_id for fast lookups
CREATE INDEX idx_projects_tenant_id ON projects (tenant_id);
