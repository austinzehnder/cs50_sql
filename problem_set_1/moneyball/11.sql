"""
write a SQL query to find the 10 least expensive players per hit in 2001.
Your query should return a table with three columns, one for the players’ first names, one of their last names, and one called “dollars per hit”.
You can calculate the “dollars per hit” column by dividing a player’s 2001 salary by the number of hits they made in 2001. Recall you can use AS to rename a column.
Dividing a salary by 0 hits will result in a NULL value. Avoid the issue by filtering out players with 0 hits.
Sort the table by the “dollars per hit” column, least to most expensive. If two players have the same “dollars per hit”, order by first name, followed by last name, in alphabetical order.
As in 10.sql, ensure that the salary’s year and the performance’s year match.
You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
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
