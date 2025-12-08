DROP TABLE IF EXISTS "meteorites";
DROP TABLE IF EXISTS "meteorites_temp";

CREATE TABLE IF NOT EXISTS "meteorites" (
    "id" INTEGER,
    "name" TEXT UNIQUE,
    "class" TEXT ,
    "mass" REAL ,
    "discovery" CHECK ("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "meteorites_temp" (
    "name" TEXT UNIQUE,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT ,
    "mass" REAL ,
    "discovery" CHECK ("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY ("id")
);