SELECT "city", COUNT("type") AS "counts" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "counts" <= 3
ORDER BY COUNT("type") DESC, "city" ASC;