SELECT "name", ROUND(AVG("salary"), 2) AS "average salary" FROM "teams"
JOIN "salaries" ON "teams"."id" = "salaries"."team_id"
GROUP BY "teams"."name"
ORDER BY "average salary" ASC
LIMIT 5;