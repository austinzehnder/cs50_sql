-- Drop tables
DROP TABLE IF EXISTS "meteorites";

-- Create tables
CREATE TEMP TABLE "meteorites_temp" (
    "name" TEXT NOT NULL,
    "id" INTEGER,
    "nametype" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC
);

-- Import data to temp table
.mode csv
.import meteorites.csv "meteorites_temp"

-- Remove meteorites with the nametype "relict" and remove header row
DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

DELETE FROM "meteorites_temp"
WHERE "name" = 'name';

-- Round "mass", "lat", "lang to 2 places
UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);

-- Create the final table, 'meteorites', and insert cleaned data
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC DEFAULT NULL,
    "discovery" TEXT,
    "year" NUMERIC DEFAULT NULL,
    "lat" NUMERIC DEFAULT NULL,
    "long" NUMERIC DEFAULT NULL
);

--Insert data from temp table to "meteorites"
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
FROM "meteorites_temp"
ORDER BY "year" DESC, "name" ASC;

--Ensure no empty values
UPDATE "meteorites"
SET "mass" = NULL WHERE "mass" = '';

UPDATE "meteorites"
SET "year" = NULL WHERE "year" = '';

UPDATE "meteorites"
SET "lat" = NULL WHERE "lat" = '';

UPDATE "meteorites"
SET "long" = NULL WHERE "long" = '';

-- Drop the temporary table once data is transferred
DROP TABLE "meteorites_temp";
