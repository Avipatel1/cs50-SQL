SELECT "first_name", "last_name" FROM (
    SELECT "first_name", "last_name", "salary"/"H" AS "dollars per hit" FROM "players"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    WHERE "H" > 0 AND "performances"."year" = "salaries"."year" AND "performances"."year" = 2001
    ORDER BY "dollars per hit" ASC, "first_name" ASC, "last_name" ASC
    LIMIT 10
)
INTERSECT
SELECT "first_name", "last_name" FROM (
    SELECT "first_name", "last_name", "salary"/"RBI" AS "dollars per hit" FROM "players"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    WHERE "RBI" > 0 AND "performances"."year" = "salaries"."year" AND "performances"."year" = 2001
    ORDER BY "dollars per hit" ASC, "first_name" ASC, "last_name" ASC
    LIMIT 10
);