CREATE TABLE tasks (
    id          SERIAL          PRIMARY KEY,
    description VARCHAR( 1024 ) NOT NULL,
    done        BOOLEAN         NOT NULL DEFAULT FALSE
);
