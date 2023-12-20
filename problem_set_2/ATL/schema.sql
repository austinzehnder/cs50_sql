CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL CHECK("age" != 0),
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER,
    "airline_id" INTEGER,
    PRIMARY KEY("id")
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id")
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
    FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights"(
    "id" INTEGER,
    "number" INTEGER NOT NULL,
    "airline" TEXT NOT NULL,
    "depart_airport" TEXT NOT NULL,
    "arrive_airport" TEXT NOT NULL,
    "depart_datetime" NUMERIC NOT NULL,
    "arrive_datetime" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);
