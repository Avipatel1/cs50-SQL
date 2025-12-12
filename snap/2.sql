DROP INDEX IF EXISTS "messages_id";

CREATE INDEX IF NOT EXISTS "messages_id"
ON "messages"("id");

EXPLAIN QUERY PLAN
SELECT "expires_timestamp" FROM "messages"
WHERE "id" = '151';