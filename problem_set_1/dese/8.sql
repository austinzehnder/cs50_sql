"""
write a SQL query to display the names of all school districts and the number of pupils enrolled in each
"""

SELECT "d"."name" AS "name", "e"."pupils" AS "students" FROM "districts" AS "d"
JOIN "expenditures" AS "e" ON "d"."id" = "e"."district_id";
