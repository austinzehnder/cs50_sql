"""
write a SQL query to find the names of all schools in the Cambridge school district
"""

SELECT "s"."name"
FROM "districts" AS "d"
JOIN "schools" AS "s" ON "d"."id" = "s"."district_id"
WHERE "s"."district_id" = (
    SELECT "id" FROM "districts" WHERE "name" = 'Cambridge'
);
