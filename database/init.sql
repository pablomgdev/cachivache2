DROP DATABASE IF EXISTS cachivache2;

CREATE DATABASE cachivache2
    ENCODING = 'UTF8'
    LC_COLLATE = 'es_ES.UTF-8'
    LC_CTYPE = 'es_ES.UTF-8'
    LOCALE_PROVIDER = 'default'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE account_statuses (
    account_status_id SMALLINT PRIMARY KEY,
    name VARCHAR(32),
);

CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    second_name VARCHAR(32),
    last_name VARCHAR(32),
    last_name_2 VARCHAR(32),
    email VARCHAR(255) UNIQUE,
    username VARCHAR(20) UNIQUE,
    hashed_password VARCHAR(64) NOT NULL,
    salt VARCHAR(64) NOT NULL,
    account_status SMALLINT NOT NULL,
    registration_date TIMESTAMPTZ,
    last_login_date TIMESTAMPTZ,
    -- dashboard_id UUID UNIQUE,
    CONSTRAINT fk_account_status FOREIGN KEY (account_status) REFERENCES account_statuses(account_status_id),
    CONSTRAINT fk_dashboard_id FOREIGN KEY (dashboard_id) REFERENCES another_table_name(dashboard_id_column)
);

CREATE TABLE dashboards (
    dashboard_id UUID PRIMARY KEY,
    owner_id UUID,
    CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES users(users),
);

CREATE TABLE user_dashboard_access (
    user_id UUID,
    dashboard_id UUID,
    PRIMARY KEY (user_id, dashboard_id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_dashboard_id FOREIGN KEY (dashboard_id) REFERENCES users(dashboard_id)
);
