-- In one_bedrooms.sql, write a SQL statement to create a view named one_bedrooms. This view should contain all listings that have exactly one bedroom. Ensure the view contains the following columns:

-- id, which is the id of the listing from the listings table.
-- property_type, from the listings table.
-- host_name, from the listings table.
-- accommodates, from the listings table.


DROP VIEW IF EXISTS "one_bedrooms";

CREATE VIEW IF NOT EXISTS "one_bedrooms" AS
SELECT "id", "property_type", "host_name", "accommodates"  FROM "listings"
WHERE "bedrooms" = 1;

-- How many one-bedroom listings are there? And how many can accommodate at least 4 guests? 
SELECT COUNT(*) FROM "one_bedrooms" LIMIT 5;

-- Use your one_bedrooms view to find that of the 1,228 one-bedrooms, 222 of them can accommodate your group of 4.
SELECT COUNT("accommodates") FROM "one_bedrooms"
WHERE "accommodates" >= 4;