"""
write a SQL statement to create a view named june_vacancies. 
This view should contain all listings and the number of days in June of 2023 that they remained vacant. 
Ensure the view contains the following columns:
id, which is the id of the listing from the listings table.
property_type, from the listings table.
host_name, from the listings table.
days_vacant, which is the number of days in June of 2023, that the given listing was marked as available.
"""

CREATE VIEW "june_vacancies" AS
SELECT "a"."listing_id", "l"."property_type", "l"."host_name",
    COUNT(DISTINCT ("a"."date")) AS "days_vacant"
FROM "availabilities" AS "a"
JOIN "listings" AS "l" ON "a"."listing_id" = "l"."id"
WHERE "a"."date" >= '2023-06-01'
AND "a"."date" < '2023-07-01'
AND "available" = 'TRUE'
GROUP BY "l"."id", "l"."property_type", "l"."host_name";
