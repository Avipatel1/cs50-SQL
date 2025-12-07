SELECT "schools"."name", "expenditures"."per_pupil_expenditure", "graduation_rates"."graduated" FROM "schools"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
JOIN "districts" ON "schools"."district_id" = "districts"."id"
ORDER BY "per_pupil_expenditure" DESC;