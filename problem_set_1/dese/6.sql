"""
write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate
"""

SELECT "s"."name" AS "name" FROM "graduation_rates" AS "g"
JOIN "schools" AS "s" ON "g"."school_id" = "s"."id"
WHERE "graduated" = 100;
