"""
write a SQL query to find the 10 public school districts with the highest per-pupil expenditures. 
Your query should return the names of the districts and the per-pupil expenditure for each
"""

SELECT "d"."name", "e"."per_pupil_expenditure"
FROM "expenditures" AS "e"
JOIN "districts" AS "d" ON "e"."district_id" = "d"."id"
WHERE EXISTS (
    SELECT 1 FROM schools AS s
    WHERE s.district_id = d.id AND s.type = 'Public School'
)
GROUP BY d.name, e.per_pupil_expenditure
ORDER BY "per_pupil_expenditure" DESC
LIMIT 10;
