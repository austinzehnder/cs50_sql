"""
write a SQL query to find the 2001 salary of the player who hit the most home runs in 2001.
Your query should return a table with one column, the salary of the player
"""

SELECT "s"."salary"
FROM "salaries" AS "s"
JOIN "performances" AS "p" ON "s"."player_id" = "p"."player_id"
WHERE "p"."year" = 2001
AND
"s"."year" = 2001
ORDER BY "p"."hr" DESC
LIMIT 1;
