DROP TABLE IF EXISTS "passengers";
DROP TABLE IF EXISTS "check ins";
DROP TABLE IF EXISTS "airlines";
DROP TABLE IF EXISTS "flights";



CREATE TABLE IF NOT EXISTS "passengers" (
    "id" INTEGER NOT NULL PRIMARY KEY,
    "first name" TEXT NOT NULL,
    "last name" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS "check ins" (
    "id" INTEGER NOT NULL PRIMARY KEY,
    "first name" TEXT NOT NULL,
    "last name" TEXT NOT NULL,
    "check in date" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "airline name" TEXT NOT NULL,
    "flight number" INTEGER NOT NULL,
    FOREIGN KEY("airline name") REFERENCES "flights"("airline name"),
    FOREIGN KEY("flight number") REFERENCES "flights"("flight number")
    FOREIGN KEY("first name") REFERENCES "passengers"("first name"),
    FOREIGN KEY("last name") REFERENCES "passengers"("last name")

);

CREATE TABLE IF NOT EXISTS "airlines" (
    "id" INTEGER NOT NULL PRIMARY KEY,
    "airline name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    FOREIGN KEY("airline name") REFERENCES "flights"("airline name")
);

CREATE TABLE IF NOT EXISTS "flights" (
    "id" INTEGER NOT NULL PRIMARY KEY,
    "flight number" INTEGER NOT NULL,
    "airline name" TEXT NOT NULL,
    "departure datetime" TEXT NOT NULL,
    "arrival datetime" TEXT NOT NULL,
    "deperture airport code" TEXT NOT NULL,
    "destination airport code" TEXT NOT NULL
);

INSERT INTO "passengers" ("first name", "last name", "age") VALUES
('Amelia', 'Earhart', 39);

INSERT INTO "check ins" ("first name", "last name", "check in date", "airline name", "flight number") VALUES
('Amelia', 'Earhart', '2023-08-03 15:03:00', 'Delta', 300);

INSERT INTO "airlines" ("airline name", "concourse") VALUES
('Delta', 'A'),
('Delta', 'B'),
('Delta', 'C'),
('Delta', 'D'),
('Delta', 'T');

INSERT INTO "flights" ("flight number", "airline name", "departure datetime", "arrival datetime", "deperture airport code", "destination airport code") VALUES
(300, 'Delta', '2023-08-03 18:46:00', '2023-08-03 21:09:00', 'ATL', 'BOS');