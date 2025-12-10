-- In june_vacancies.sql, write a SQL statement to create a view named june_vacancies. 
-- This view should contain all listings and the number of days in June of 2023 that they remained vacant. 
-- Ensure the view contains the following columns:

-- id, which is the id of the listing from the listings table.
-- property_type, from the listings table.
-- host_name, from the listings table.
-- days_vacant, which is the number of days in June of 2023, that the given listing was marked as available.

DROP VIEW IF EXISTS "june_vacancies";

CREATE VIEW IF NOT EXISTS "june_vacancies" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("date") AS "days_vacant"  
FROM "listings"
JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE "available" = 'TRUE' AND "date" LIKE '2023-06%'
GROUP BY "listings"."id";

-- How many listings were available in June 2023? Use your june_vacancies view to find that there were 1,895 vacancies.
SELECT COUNT("id") FROM "june_vacancies";