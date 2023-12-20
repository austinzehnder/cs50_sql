"""
write a SQL query to find public school districts with above-average per-pupil expenditures and an above-average percentage 
of teachers rated “exemplary”. Your query should return the districts’ names, along with their per-pupil expenditures 
and percentage of teachers rated exemplary. Sort the results first by the percentage of teachers rated exemplary 
(high to low), then by the per-pupil expenditure (high to low).
"""

SELECT "d"."name" AS "district name", "e"."per_pupil_expenditure" AS "per_pupil_expenditure", "s"."exemplary" AS "exemplary percentage"
FROM "districts" AS "d"
JOIN "expenditures" AS "e" ON "d"."id" = "e"."district_id"
JOIN "staff_evaluations" AS "s" ON "e"."district_id" = "s"."district_id"
WHERE "e"."per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure") FROM "expenditures")
AND
"s"."exemplary" > (
    SELECT AVG("exemplary") FROM "staff_evaluations")
ORDER BY "s"."exemplary" DESC, "e"."per_pupil_expenditure" DESC;
