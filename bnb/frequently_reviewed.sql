-- Frequently Reviewed
-- In frequently_reviewed.sql, write a SQL statement to create a view named frequently_reviewed. 
-- This view should contain the 100 most frequently reviewed listings, sorted from most- to least-frequently reviewed. 
-- Ensure the view contains the following columns:

-- id, which is the id of the listing from the listings table.
-- property_type, from the listings table.
-- host_name, from the listings table.
-- reviews, which is the number of reviews the listing has received.
-- If any two listings have the same number of reviews, sort by property_type (in alphabetical order), followed by host_name (in alphabetical order).


DROP VIEW IF EXISTS "frequently_reviewed";

CREATE VIEW IF NOT EXISTS "frequently_reviewed" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("listings"."id") AS "num_reviews" FROM "reviews"
JOIN "listings" ON "listings"."id" = "reviews"."listing_id"
GROUP BY "listings"."id"
ORDER BY "num_reviews" DESC
LIMIT 100;

-- How many reviews does the most frequently reviewed property have? 
SELECT "host_name", MAX("num_reviews") FROM "frequently_reviewed";
-- And who is the host of that property? Use your frequently_reviewed view to find that Tiffany’s property has 860 reviews.