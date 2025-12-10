DROP VIEW IF EXISTS "message";
DROP VIEW IF EXISTS "get_sentences";
DROP TABLE IF EXISTS "code";


CREATE TABLE IF NOT EXISTS "code" (
  "id" INTEGER,
  "sentence_num" INTEGER,
  "char" INTEGER,
  "len" INTEGER,
  PRIMARY KEY ("id")
);

-- run the following commands in the terminal before executing the next few queries
-- sqlite3 private.db
-- .read private.sql
-- .import --csv --skip 1 code.csv code

CREATE VIEW IF NOT EXISTS "get_sentences" AS
SELECT * FROM "sentences"
JOIN "code" ON "code"."sentence_num" = "sentences"."id";

CREATE VIEW IF NOT EXISTS "message" AS
SELECT substr("sentence", "char", "len") AS "phrase" FROM "get_sentences";

SELECT * FROM "message";
