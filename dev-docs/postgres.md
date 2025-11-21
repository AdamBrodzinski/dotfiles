
## Create a new database with users

```sql
CREATE DATABASE dbname;

CREATE USER dbname_readonly WITH PASSWORD 'readonly_password_here';

GRANT CONNECT ON DATABASE dbname TO dbname_readonly;

-- NOTE: you must switch database schemas before running the following commands

GRANT USAGE ON SCHEMA public TO dbname_readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO dbname_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO dbname_readonly;


-- Create read/write user with additional privileges for migrations

CREATE USER dbname_api WITH PASSWORD 'api_password_here';

GRANT CONNECT ON DATABASE dbname TO dbname_api;

-- Grant full schema permissions
GRANT USAGE, CREATE ON SCHEMA public TO dbname_api;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO dbname_api;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO dbname_api;

GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO dbname_api;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON SEQUENCES TO dbname_api;

GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO dbname_api;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON FUNCTIONS TO dbname_api;
```
