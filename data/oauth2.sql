CREATE TABLE oauth_auth_codes (
    id VARCHAR(100),
    user_id INTEGER,
    client_id INTEGER,
    scopes TEXT NULL,
    revoked BOOLEAN,
    expires_at TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE oauth_access_tokens (
    id VARCHAR(100),
    user_id INTEGER NULL,
    client_id INTEGER,
    name VARCHAR(255) NULL,
    scopes TEXT NULL,
    revoked BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX idx1_oauth_access_tokens ON oauth_access_tokens(user_id);

CREATE TABLE oauth_refresh_tokens (
    id VARCHAR(100),
    access_token_id VARCHAR(100),
    revoked BOOLEAN,
    expires_at TIMESTAMP NULL,
    PRIMARY KEY(id)
);
CREATE INDEX idx1_oauth_refresh_tokens ON oauth_refresh_tokens(access_token_id);

CREATE TABLE oauth_clients (
    name VARCHAR(255) NOT NULL,
    user_id INTEGER NULL,
    secret VARCHAR(100),
    redirect VARCHAR(255),
    personal_access_client BOOLEAN,
    password_client BOOLEAN,
    revoked BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (name)
);
CREATE INDEX idx1_oauth_clients ON oauth_clients(user_id);

CREATE TABLE oauth_personal_access_clients (
    client_id INTEGER,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
CREATE INDEX idx1_oauth_personal_access_clients ON oauth_personal_access_clients(client_id);

CREATE TABLE oauth_users (
    username VARCHAR(40) NOT NULL,
    password VARCHAR(100) NOT NULL,
    first_name VARCHAR(80),
    last_name VARCHAR(80),
    PRIMARY KEY (username)
);
