"""
write a SQL query to find the 50 players paid the least in 2001.
Sort players by salary, lowest to highest.
If two players have the same salary, sort alphabetically by first name and then by last name.
If two players have the same first and last name, sort by player ID.
Your query should return three columns, one for players’ first names, one for their last names, and one for their salaries
"""

SELECT "s"."salary", "p"."first_name", "p"."last_name"
FROM "players" AS "p"
JOIN "salaries" AS "s" ON "p"."id" = "s"."player_id"
WHERE "s"."year" = 2001
ORDER BY "s"."salary" ASC, "p"."first_name" ASC, "p"."last_name", "p"."id" ASC
LIMIT 50;
