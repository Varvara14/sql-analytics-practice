WITH RECURSIVE r AS (
    SELECT
        'a'::varchar(1)  AS start_point,
        'a'::varchar(1)  AS current_point,
        ',a,'::varchar   AS visited,
        'a'::varchar     AS path,
        0::integer       AS path_cost,
        1::integer       AS depth
    UNION ALL
    SELECT
        r.start_point,
        t.point2 AS current_point,
        (r.visited || t.point2 || ',')::varchar AS visited,
        (r.path || ',' || t.point2)::varchar    AS path,
        (r.path_cost + t.cost)::integer         AS path_cost,
        (r.depth + 1)::integer                  AS depth
    FROM r
    JOIN troute t
      ON t.point1 = r.current_point
    WHERE r.depth < 4
      AND POSITION(',' || t.point2 || ',' IN r.visited) = 0
),
tours AS (
    SELECT
        r.path_cost + back.cost AS total_cost,
        '{' || r.path || ',' || r.start_point || '}' AS tour
    FROM r
    JOIN troute back
      ON back.point1 = r.current_point
     AND back.point2 = r.start_point
    WHERE r.depth = 4
)
SELECT total_cost, tour
FROM tours
WHERE total_cost = (SELECT MIN(total_cost) FROM tours) OR total_cost = (SELECT MAX(total_cost) FROM tours)
ORDER BY total_cost, tour;
