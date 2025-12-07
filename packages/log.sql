
-- *** The Lost Letter ***
SELECT "address", "type" FROM "addresses"
WHERE "id" IN (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = 
    (
    SELECT "package_id" FROM "scans"
    WHERE action = 'Drop' AND "address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '900 Somerville Avenue'
    )
    UNION
    SELECT "package_id" FROM "scans"
    WHERE action = 'Drop' AND "address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" LIKE '%2 Finn%'
    )
    )
);

-- *** The Devious Delivery ***
SELECT "type" FROM "addresses"
WHERE "id" = (SELECT "package_id" FROM "scans"
    WHERE action = 'Drop' AND "address_id" = (
        SELECT "to_address_id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
);

SELECT "contents" FROM "packages"
    WHERE "id" = (SELECT "package_id" FROM "scans"
    WHERE action = 'Pick' AND "address_id" = (
        SELECT "to_address_id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
);

-- *** The Forgotten Gift ***
SELECT "contents" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '109 Tileston Street'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '728 Maple Place'
);

SELECT "address" FROM "addresses"
WHERE "id" IN (
    SELECT DISTINCT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        ) AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '728 Maple Place'
        )
    )
) AND "address" NOT IN ('109 Tileston Street', '728 Maple Place');
