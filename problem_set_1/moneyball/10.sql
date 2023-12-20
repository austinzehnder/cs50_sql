"""
The general manager has asked you for a report which details each player’s name, their salary for each year 
they’ve been playing, and their number of home runs for each year they’ve been playing. 
To be precise, the table should include:
All player’s first names
All player’s last names
All player’s salaries
All player’s home runs
The year in which the player was paid that salary and hit those home runs
"""

SELECT "pl"."first_name" AS "first name", "pl"."last_name" AS "last name", "s"."salary" AS "salary",
"pe"."hr" AS "HR", "pe"."year" AS "year"
FROM "performances" AS "pe"
JOIN "players" AS "pl" ON "pe"."player_id" = "pl"."id"
JOIN "salaries" AS "s" ON "pl"."id" = "s"."player_id"
WHERE "pe"."year" = "s"."year"
ORDER BY "pl"."id" ASC, "pe"."year" DESC, "hr" DESC, "salary" DESC;
