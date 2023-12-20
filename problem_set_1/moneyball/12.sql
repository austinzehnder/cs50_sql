"""
write a SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.
Your query should return a table with two columns, one for the players’ first names and one of their last names.
You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).
Keep in mind the lessons you’ve learned in 10.sql and 11.sql!
"""

WITH "SalaryPerHit" AS (
    SELECT "p"."id", "p"."first_name", "p"."last_name",
           "s"."salary" / "perf"."H" as "salary_per_hit"
    FROM "players" AS "p"
    JOIN "salaries" AS "s" ON "p"."id" = "s"."player_id"
    JOIN "performances" AS "perf" ON "p"."id" = "perf"."player_id"
    WHERE "s"."year" = 2001 AND "perf"."year" = 2001 AND "perf"."H" > 0
    ORDER BY "salary_per_hit" ASC
    LIMIT 10
),
"SalaryPerRBI" AS (
    SELECT "p"."id", "p"."first_name", "p"."last_name",
           "s"."salary" / "perf"."RBI" as "salary_per_RBI"
    FROM "players" AS "p"
    JOIN "salaries" AS "s" ON "p"."id" = "s"."player_id"
    JOIN "performances" AS "perf" ON "p"."id" = "perf"."player_id"
    WHERE "s"."year" = 2001 AND "perf"."year" = 2001 AND "perf"."RBI" > 0
    ORDER BY "salary_per_RBI" ASC
    LIMIT 10
)
SELECT DISTINCT "spH"."first_name", "spH"."last_name"
FROM "SalaryPerHit" AS "spH"
JOIN "SalaryPerRBI" AS "spR" ON "spH"."id" = "spR"."id"
ORDER BY "spH"."id" ASC;
