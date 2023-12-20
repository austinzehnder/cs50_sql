"""
write a SQL query to find the name (or names) of the school district(s) 
with the single least number of pupils. Report only the name(s)
"""

SELECT "d"."name" FROM "districts" AS "d"
JOIN "expenditures" AS "e" ON "d"."id" = "e"."district_id"
ORDER BY "e"."pupils" ASC
LIMIT 1;
