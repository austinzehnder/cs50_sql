"""
write a query to return just such a table:
Your query should return a table with five columns, per the above.
Order the results, first and foremost, by player’s IDs (least to greatest).
Order rows about the same player by year, in descending order.
Consider a corner case: suppose a player has multiple salaries or performances for a given year. Order them first by number of home runs, in descending order, followed by salary, in descending order.
Be careful to ensure that, for a single row, the salary’s year and the performance’s year match.
"""

SELECT "pl"."first_name" AS "first name", "pl"."last_name" AS "last name", ("s"."salary"/"pe"."h") AS "dollars per hit"
FROM "performances" AS "pe"
JOIN "players" AS "pl" ON "pe"."player_id" = "pl"."id"
JOIN "salaries" AS "s" ON "pl"."id" = "s"."player_id"
WHERE "pe"."h" > 0
AND
"s"."salary" > 0
AND
"pe"."year" = 2001
AND
"s"."year" = 2001
ORDER BY "dollars per hit" ASC, "pl"."first_name" ASC, "pl"."last_name" ASC
LIMIT 10;
