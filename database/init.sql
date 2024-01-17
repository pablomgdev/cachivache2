DROP DATABASE IF EXISTS cachivache2;

CREATE DATABASE cachivache2
    ENCODING            = 'UTF8'
    LC_COLLATE          = 'es_ES.UTF-8'
    LC_CTYPE            = 'es_ES.UTF-8'
    LOCALE_PROVIDER     = 'libc'
    TABLESPACE          = pg_default
    CONNECTION LIMIT    = -1
    IS_TEMPLATE         = False;

CREATE TABLE account_statuses (
    account_status_id   SMALLINT PRIMARY KEY,
    name                VARCHAR(32)
);

CREATE TABLE users (
    user_id             UUID PRIMARY KEY,
    name                VARCHAR(32) NOT NULL,
    second_name         VARCHAR(32),
    last_name           VARCHAR(32),
    last_name_2         VARCHAR(32),
    email               VARCHAR(255) UNIQUE,
    username            VARCHAR(20) UNIQUE,
    hashed_password     VARCHAR(64) NOT NULL,
    salt                VARCHAR(64) NOT NULL,
    account_status_id   SMALLINT NOT NULL,
    registration_date   TIMESTAMPTZ,
    last_login_date     TIMESTAMPTZ,
    CONSTRAINT fk__users__account_statuses__account_status_id FOREIGN KEY (account_status_id) REFERENCES account_statuses(account_status_id)
);

CREATE TABLE dashboards (
    dashboard_id    UUID PRIMARY KEY,
    owner_id        UUID NOT NULL,
    CONSTRAINT fk__dashboards__users__owner_id FOREIGN KEY (owner_id) REFERENCES users(user_id)
);

CREATE TABLE user_dashboard_access (
    user_id         UUID,
    dashboard_id    UUID,
    PRIMARY KEY (user_id, dashboard_id),
    CONSTRAINT fk__user_dashboard_access__users__user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk__user_dashboard_access__dashboards__dashboard_id FOREIGN KEY (dashboard_id) REFERENCES dashboards(dashboard_id)
);

CREATE TABLE gift_statuses (
    gift_status_id  SMALLINT PRIMARY KEY,
    name            VARCHAR(32)
);

CREATE TABLE gifts (
    gift_id         UUID PRIMARY KEY,
    description     VARCHAR(255),
    link            VARCHAR(255),
    image_url       VARCHAR(255),
    gift_state_id   SMALLINT NOT NULL,
    is_deleted      BOOLEAN NOT NULL,
    dashboard_id    UUID NOT NULL,
    CONSTRAINT fk__gifts__dashboards__dashboard_id FOREIGN KEY (dashboard_id) REFERENCES dashboards(dashboard_id)
);

CREATE TABLE purchase_participants (
    user_id UUID,
    gift_id UUID,
    PRIMARY KEY (user_id, gift_id),
    CONSTRAINT fk__purchase_participants__users__user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk__purchase_participants__gifts__gift_id FOREIGN KEY (gift_id) REFERENCES gifts(gift_id)
);
