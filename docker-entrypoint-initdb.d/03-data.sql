INSERT INTO example_p (key, value, applies_to, effective_at)
VALUES ('A', 3, '2021-02-01', '2021-02-01');
-- An example of deciding a fact which takes effect in the future
INSERT INTO example_p (key, value, applies_to, effective_at)
VALUES ('B', 17, '2021-02-01', '2021-01-15');
-- Two examples of revising a fact previously decided
INSERT INTO example_p (key, value, applies_to, effective_at)
VALUES ('A', 4, '2021-02-01', '2021-02-02');
INSERT INTO example_p (key, value, applies_to, effective_at)
VALUES ('A', 2, '2021-02-01', '2021-02-03');
