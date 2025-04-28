
-- *** The Lost Letter ***
SELECT addresses.address, addresses.type
FROM addresses
WHERE addresses.id IN (
    SELECT scans.address_id
    FROM scans
    WHERE scans.package_id = (
        SELECT packages.id
        FROM packages
        WHERE packages.from_address_id = (
            SELECT addresses.id
            FROM addresses
            WHERE addresses.address = '900 Somerville Avenue'
        )
        AND packages.to_address_id = (
            SELECT addresses.id
            FROM addresses
            WHERE addresses.address LIKE '2 ________ Street'
        )
    )
    AND scans.action = 'Drop'
);

-- *** The Devious Delivery ***

SELECT addresses.type
FROM addresses
WHERE addresses.id = (
    SELECT scans.address_id
    FROM scans
    WHERE scans.package_id IN (
        SELECT packages.id
        FROM packages
        WHERE packages.from_address_id IS NULL
    )
    AND scans.address_id != (
        SELECT packages.to_address_id
        FROM packages
        WHERE packages.from_address_id IS NULL
    )
);

SELECT "contents" FROM "packages"
WHERE "from_address_id" IS NULL;

-- *** The Forgotten Gift ***
SELECT * FROM packages
WHERE packages.from_address_id = (
SELECT addresses.id FROM addresses
    WHERE addresses.address='109 Tileston Street'
)
AND
packages.to_address_id = (
SELECT addresses.id FROM addresses
    WHERE addresses.address='728 Maple Place'
)


SELECT "name" FROM "drivers"
WHERE "id" IN (
    SELECT "driver_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '728 Maple Place'
        )
        AND "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        )
    )
    AND "address_id" != (
        SELECT "id" FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    )
    AND "action" = "Pick"
);

