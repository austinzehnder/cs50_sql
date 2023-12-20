
-- *** The Lost Letter ***
SELECT
"a"."address" AS "current location", "a"."type" AS "location type",
"p"."contents" AS "package contents", "s"."timestamp" AS "timestamp",
"s"."action" AS "action"
FROM "scans" AS "s"
JOIN "packages" AS "p" ON "s"."package_id" = "p"."id"
JOIN "addresses" AS "a" ON "s"."address_id" = "a"."id"
WHERE "p"."from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
  )
AND
  "p"."to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" LIKE '%Finn%'
  )
ORDER BY
  "s"."timestamp" DESC
LIMIT 1;

-- *** The Devious Delivery ***
SELECT
"a"."address" AS "current location", "a"."type" AS "location type",
"p"."contents" AS "package contents", "s"."timestamp" AS "timestamp",
"s"."action" AS "action"
FROM "scans" AS "s"
JOIN "packages" AS "p" ON "s"."package_id" = "p"."id"
JOIN "addresses" AS "a" ON "s"."address_id" = "a"."id"
WHERE "contents" LIKE '%duck%'
AND
"contents" != 'Rubber duck'
ORDER BY
  "s"."timestamp" DESC
LIMIT 1;

-- *** The Forgotten Gift ***
SELECT
"a"."address" AS "current location", "a"."type" AS "location type",
"p"."contents" AS "package contents", "s"."timestamp" AS "timestamp",
"s"."action" AS "action", "p"."id"
FROM "scans" AS "s"
JOIN "packages" AS "p" ON "s"."package_id" = "p"."id"
JOIN "addresses" AS "a" ON "s"."address_id" = "a"."id"
WHERE "p"."from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
    )
AND
  "p"."to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
  )
AND "s"."action" = "Drop"
ORDER BY
  "s"."timestamp" DESC
LIMIT 1;

--Find driver's name who has the package
SELECT "name" FROM "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = 9523
);submit50 cs50/problems/2023/sql/packages

