DROP VIEW IF EXISTS "no_descriptions";

CREATE VIEW IF NOT EXISTS "no_descriptions" AS
SELECT "id", "property_type", "host_name", "accommodates", "bedrooms"  FROM "listings";

-- How many listings are there in total? Use your no_descriptions view to find that there are 3,973.
SELECT COUNT(*) FROM "no_descriptions" LIMIT 5;