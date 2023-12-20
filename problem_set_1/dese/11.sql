"""
write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate. 
Sort the schools from greatest per-pupil expenditure to least. 
If two schools have the same per-pupil expenditure, sort by school name.
You should assume a school spends the same amount per-pupil their district as a whole spends.

"""

SELECT "s"."name" AS "name", "e"."per_pupil_expenditure" AS "per_pupil_expenditure", "g"."graduated" AS "graduation rate"
FROM "expenditures" AS "e"
JOIN "schools" AS "s" ON "e"."district_id" = "s"."district_id"
JOIN "graduation_rates" AS "g" ON "s"."id" = "g"."school_id"

ORDER BY "per_pupil_expenditure" DESC, "s"."name" ASC;
