"""
write a SQL query to find all teams that Satchel Paige played for.
Your query should return a table with a single column, one for the name of the teams.
"""

SELECT DISTINCT("t"."name") AS "team name"
FROM "teams" AS "t"
JOIN "performances" AS "pe" ON "t"."id" = "pe"."team_id"
JOIN "players" AS "pl" ON "pe"."player_id" = "pl"."id"
WHERE "pl"."first_name" = 'Satchel'AND "pl"."last_name" = 'Paige'
ORDER BY "team name";
