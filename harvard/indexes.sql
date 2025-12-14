DROP INDEX IF EXISTS "enrollments_index";
DROP INDEX IF EXISTS "course_id_index";
DROP INDEX IF EXISTS "course_id_index_2";
DROP INDEX IF EXISTS "satisfies_index";

CREATE INDEX IF NOT EXISTS "enrollments_index"
ON "enrollments"("student_id", "course_id");

CREATE INDEX IF NOT EXISTS "course_id_index"
ON "courses"("department", "semester", "title", "number");

CREATE INDEX IF NOT EXISTS "course_id_index_2"
ON "courses"("semester")
WHERE "semester" LIKE 'Fall%';

CREATE INDEX IF NOT EXISTS "satisfies_index"
ON "satisfies"("course_id", "requirement_id");


