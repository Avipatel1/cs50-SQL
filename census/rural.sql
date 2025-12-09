DROP VIEW IF EXISTS "rural";

CREATE VIEW IF NOT EXISTS "rural" AS
    SELECT * FROM "census"
    WHERE "locality" LIKE '%rural%';


-- SELECT * from "rural"; -- 461 rural districts
-- SELECT SUM("families") FROM "rural";  -- 2,229,834 families
