DROP VIEW IF EXISTS "by_district";

CREATE VIEW IF NOT EXISTS "by_district" AS 
SELECT "district", SUM("families") AS "families", SUM("households") AS "households", SUM("population") AS "population", SUM("male") AS "male", SUM("female") AS "female" FROM "census"
GROUP BY "district"
ORDER BY "families" ASC;

SELECT * FROM "by_district";