CREATE TABLE "ingredients" (
    "id" INTEGER PRIMARY KEY,
    "ingredient" TEXT NOT NULL,
    "price_per_unit" REAL NOT NULL
);

CREATE TABLE "donuts" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "gluten_free" TEXT CHECK("gluten_free" IN ('yes', 'no')) NOT NULL,
    "price_per_donut" REAL NOT NULL,
    "ingredient_id" INTEGER,
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "donut_ingredients" (
    "id" INTEGER PRIMARY KEY,
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);

CREATE TABLE "orders" (
    "id" INTEGER PRIMARY KEY,
    "order_number" INTEGER NOT NULL UNIQUE,
    "customer_id" INTEGER,
    "donut_id" INTEGER,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "order_details" (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "quantity" INTEGER NOT NULL,
    "cost" REAL NOT NULL,
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);
