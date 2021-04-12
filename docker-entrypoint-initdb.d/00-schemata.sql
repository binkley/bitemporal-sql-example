CREATE TABLE example_p
(
    key          TEXT      NOT NULL,
    value        INTEGER   NOT NULL,
    applies_to   TIMESTAMP NOT NULL,
    effective_at TIMESTAMP NOT NULL,
    PRIMARY KEY (key, applies_to, effective_at)
);
