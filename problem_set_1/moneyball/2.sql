"""
write a SQL query to find Cal Ripken Jr.’s salary history.
Sort by year in descending order.
Your query should return a table with two columns, one for year and one for salary
"""

SELECT "s"."year", "s"."salary" AS "average salary"
FROM "players" AS "p"
JOIN "salaries" AS "s" ON "p"."id" = "s"."player_id"
WHERE "first_name" = 'Cal' AND "last_name" = 'Ripken'
GROUP BY "year"
ORDER BY "year" DESC;
