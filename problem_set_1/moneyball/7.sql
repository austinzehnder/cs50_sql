"""
write a SQL query to find the name of the player who’s been paid the highest salary, of all time, in Major League Baseball.
Your query should return a table with two columns, one for the player’s first name and one for their last name
"""

SELECT "p"."first_name" AS "first name", "p"."last_name" AS "last name"
FROM "players" AS "p"
JOIN "salaries" AS "s" ON "p"."id" = "s"."player_id"
ORDER BY "salary" DESC
LIMIT 1;
