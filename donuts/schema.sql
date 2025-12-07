DROP TABLE IF EXISTS "ingredients";
DROP TABLE IF EXISTS "donuts";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "customers";
DROP TABLE IF EXISTS "donut_ingredients";
DROP TABLE IF EXISTS "order_items";




CREATE TABLE IF NOT EXISTS "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" REAL NOT NULL,
    PRIMARY KEY ("id")
);


CREATE TABLE IF NOT EXISTS "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" INTEGER NOT NULL DEFAULT 0,
    "price_per_donut" REAL NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "donut_ingredients" (
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id"),
    PRIMARY KEY ("donut_id", "ingredient_id")
);
CREATE TABLE IF NOT EXISTS "orders" (
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER NOT NULL,
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE IF NOT EXISTS "customers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY ("id")
); 

CREATE TABLE "order_items" (
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    FOREIGN KEY ("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    PRIMARY KEY ("order_id", "donut_id")
);


INSERT INTO "ingredients" ("name", "price_per_unit") VALUES
('Cocoa', 5.00),
('Sugar', 2.00),
('Flour', 1.00),
('Buttermilk', 1.00),
('Sprinkles', 0.50);

INSERT INTO "donuts" ("name", "gluten_free", "price_per_donut") VALUES
('Belgian Dark Chocolate', 0, 4.00),
('Back-To-School Sprinkles', 0, 4.00);

-- Link donuts ↔ ingredients
-- Belgian Dark Chocolate = id 1
INSERT INTO donut_ingredients VALUES (1, 1); -- Cocoa
INSERT INTO donut_ingredients VALUES (1, 3); -- Flour
INSERT INTO donut_ingredients VALUES (1, 4); -- Buttermilk
INSERT INTO donut_ingredients VALUES (1, 2); -- Sugar

-- Back-To-School Sprinkles = id 2
INSERT INTO donut_ingredients VALUES (2, 3); -- Flour
INSERT INTO donut_ingredients VALUES (2, 4); -- Buttermilk
INSERT INTO donut_ingredients VALUES (2, 2); -- Sugar
INSERT INTO donut_ingredients VALUES (2, 5); -- Sprinkles

-- Customer Luis Singh
INSERT INTO customers (first_name, last_name) VALUES ('Luis', 'Singh');

-- Order #1 for Luis
INSERT INTO orders (id, customer_id) VALUES (1, 1);

-- Order items
INSERT INTO order_items VALUES (1, 1, 3); -- 3 Belgian Dark Chocolate
INSERT INTO order_items VALUES (1, 2, 2); -- 2 Back-To-School Sprinkles