/* first create user airflow on linux - useradd airflow 
create password or user airflow passwd airflow
switch user to airflow and run psql
*/

-- create user airflow on postgres

CREATE USER airflow PASSWORD 'airflow';
ALTER USER airflow PASSWORD 'airflow';

-- make airflow he superuser

ALTER USER airflow WITH SUPERUSER;

DROP DATABASE IF EXISTS orders;
DROP DATABASE IF EXISTS dwh;
DROP USER IF EXISTS dwh_svc_account;
DROP USER IF EXISTS db_owner;
DROP USER IF EXISTS oltp_read;
CREATE USER db_owner PASSWORD 'db_owner';
CREATE USER oltp_read PASSWORD 'oltp_read';
CREATE USER dwh_svc_account PASSWORD 'dwh_svc_account';

-- Create orders database
CREATE DATABASE orders;
\c orders;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO db_owner;

-- Create data warehouse db
CREATE DATABASE dwh;
\c dwh;

CREATE SCHEMA dwh AUTHORIZATION db_owner;
CREATE SCHEMA staging AUTHORIZATION db_owner;


GRANT ALL PRIVILEGES ON SCHEMA dwh TO db_owner;
GRANT ALL PRIVILEGES ON SCHEMA staging TO db_owner;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA dwh TO db_owner;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA staging TO db_owner;
