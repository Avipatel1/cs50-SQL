-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
DROP TABLE IF EXISTS "users";
DROP TABLE IF EXISTS "institutions";
DROP TABLE IF EXISTS "accounts";
DROP TABLE IF EXISTS "categories";
DROP TABLE IF EXISTS "budgets";
DROP TABLE IF EXISTS "transfers";

CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "institutions" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "accounts" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "institution_id" INTEGER NOT NULL,
    "account_name" TEXT,
    "account_type" TEXT CHECK("account_type" IN ('checking', 'savings', 'credit', 'investment')) NOT NULL,
    "balance" REAL NOT NULL DEFAULT 0.0,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("institution_id") REFERENCES "institutions"("id"),
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "categories" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT CHECK("type" IN ('income', 'expense')) NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "budgets" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "budget_name" TEXT NOT NULL,
    "monthly_limit" REAL NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("category_id") REFERENCES "categories"("id"),
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "transfers" (
    "id" INTEGER,
    "from_account" INTEGER NOT NULL,
    "to_account" INTEGER NOT NULL,
    "amount" REAL NOT NULL CHECK("amount" > 0.0),
    "transfer_time" DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("from_account") REFERENCES "accounts"("id"),
    FOREIGN KEY("to_account") REFERENCES "accounts"("id"),
    CHECK("from_account" != "to_account"),
    
    PRIMARY KEY("id")
);

DROP INDEX IF EXISTS "idx_user_email";
DROP INDEX IF EXISTS "idx_account_user";

CREATE INDEX IF NOT EXISTS "idx_user_email" ON "users"("email");
CREATE INDEX IF NOT EXISTS "idx_account_user" ON "accounts"("user_id");
