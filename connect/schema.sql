DROP TABLE IF EXISTS "users";
DROP TABLE IF EXISTS "schools";
DROP TABLE IF EXISTS "companies";
DROP TABLE IF EXISTS "connections";

CREATE TABLE "users" (
    "id" INTEGER,
    "first name" TEXT NOT NULL,
    "last name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "school name" TEXT,
    "school type" TEXT CHECK ("school type" IN ('Elementary School', 'Middle School', 'High School', 'Lower School', 'Upper School', 'College', 'University')),
    "location" TEXT,
    "year founded" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "company name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "connections" (
    "id" INTEGER,
    "user_A_id" INTEGER,
    "user_B_id" INTEGER,
    "school_id" INTEGER,
    "company_id" INTEGER,
    "school start date" TEXT,
    "school end date" TEXT,
    "company start date" TEXT,
    "company end date" TEXT,
    "degree type" TEXT,
    "company title" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY ("user_A_id") REFERENCES "users"("id"),
    FOREIGN KEY ("user_B_id") REFERENCES "users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "schools"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);

INSERT INTO "users" ("first name", "last name", "username", "password") VALUES
('Alan', 'Garber', 'alan', 'password'),
('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO "schools" ("school name", "school type", "location", "year founded") VALUES
('Harvard University', 'University', 'Cambridge, MA', 1636);

INSERT INTO "companies" ("company name", "industry", "location") VALUES
('LinkedIn', 'Technology', 'Sunnyvale, CA');

INSERT INTO "connections" ("user_A_id", "user_B_id", "school_id", "company_id", "school start date", "school end date", "company start date", "company end date", "degree type", "company title") VALUES
(1, NULL, 1, 1, '1973-09-01', '1976-06-01', NULL, NULL, 'BA', NULL),
(2, NULL, NULL, 1, NULL, NULL, '2003-01-01', '2007-02-01', NULL, 'CEO and Chairman');