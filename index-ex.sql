-- task 1
CREATE TABLE t (
    a INTEGER NOT NULL.
    b VARCHAR(10) NOT NULL,
    c BOOLEAN NOT NULL
);

INSERT INTO t (a, b, c) (
    SELECT s.id, chr(32 + random() * 94::integer), random() < 0.01
    FROM generate_series(1, 1000000) AS s(id)
    ORDER BY random()
);

-- task 2

--индекс по набору полей
-- (without index: 185.816 ms) 
-- (with index: 0.057 ms)
CREATE INDEX ON t(a,b);

EXPLAIN (ANALYZE, COSTS OFF) 
SELECT * 
FROM t
WHERE a <= 100 AND b = 'a';

DROP INDEX t_a_b_idx;

-- покрывающий индекс
-- (without index: 147.045 ms) 
-- (with index: 0.303 ms)
CREATE INDEX ON t(a);

EXPLAIN (ANALYZE, COSTS OFF) 
SELECT a
FROM t
WHERE a <= 100;

DROP INDEX t_a_idx;

-- индекс по условию
-- (without index: 388.494 ms) 
-- (with index: 5.417 ms)
CREATE INDEX ON t(LOWER(b));

EXPLAIN (ANALYZE, COSTS OFF) 
SELECT *
FROM t
WHERE LOWER(b) = 'a';

DROP t_lower_idx;

-- индекс по условию
-- (without index: 1479.821 ms) 
-- (with index: 643.129 ms)
CREATE INDEX ON t(a);

EXPLAIN (ANALYZE, COSTS OFF) 
SELECT *
FROM t
ORDER BY a;

DROP INDEX t_a_idx;