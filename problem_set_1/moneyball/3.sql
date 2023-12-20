"""
write a SQL query to find Ken Griffey Jr.’s home run history.
Sort by year in descending order.
Note that there may be two players with the name “Ken Griffey.” This Ken Griffey was born in 1969.
Your query should return a table with two columns, one for year and one for home runs.
"""

SELECT "pe"."year", "pe"."hr" FROM "players" AS "pl"
JOIN "performances" AS "pe" ON "pl"."id" = "pe"."player_id"
WHERE "first_name" = 'Ken' AND "last_name" = 'Griffey' AND "birth_year" = 1969
GROUP BY "year"
ORDER BY "year" DESC;
