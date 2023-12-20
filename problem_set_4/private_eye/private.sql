"""
you should write all SQL statements required to replicate your creation of the view. That is:
If creating the view requires creating a separate table and inserting data into it, you should ensure that 
private.sql contains the statements to create that table and insert that data. (Don’t be afraid to add tables 
and add data as you wish!)
private.sql, when run a fresh instance of private.db, should be able to fully reconstruct your view.
"""

CREATE TABLE "code" (
    "a" INTEGER PRIMARY KEY,
    "b" INTEGER NOT NULL,
    "c" INTEGER NOT NULL
);

INSERT INTO "code" ("a", "b", "c")
VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5)
;

CREATE VIEW "message" AS
SELECT substr("s"."sentence", "code"."b", "code"."c") AS "phrase"
FROM "code"
JOIN "sentences" AS "s" ON "code"."a" = "s"."id"
;
