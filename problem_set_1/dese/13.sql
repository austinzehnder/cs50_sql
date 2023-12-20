"""
write a SQL query to answer a question you have about the data! The query should:
Involve at least one JOIN or subquery
"""

SELECT "d"."name" AS "district name", "e"."per_pupil_expenditure" AS "per_pupil_expenditure", "s"."exemplary" AS "exemplary percentage"
FROM "staff_evaluations" AS "s"
JOIN "expenditures" AS "e" ON "s"."district_id" = "e"."district_id"
JOIN "districts" AS "d" ON "e"."district_id" = "d"."id"
WHERE "e"."per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure") FROM "expenditures"
)
AND
"s"."exemplary" > (
    SELECT AVG("exemplary") FROM "staff_evaluations"
)
ORDER BY "per_pupil_expenditure" DESC, "d"."name" ASC;
