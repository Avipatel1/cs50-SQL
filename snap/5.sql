DROP INDEX IF EXISTS "friends_index";

CREATE INDEX IF NOT EXISTS "friends_index"
ON "friends"("user_id", "friend_id");

EXPLAIN QUERY PLAN
SELECT "friend_id" FROM "friends"
WHERE "user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'lovelytrust487'
)
INTERSECT
SELECT "friend_id" FROM "friends"
WHERE "user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'exceptionalinspiration482'
);
