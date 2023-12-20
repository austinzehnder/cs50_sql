"""
write a set of SQL statements that create indexes which will speed up typical queries on the harvard.db database
"""

--scanning enrollments
CREATE INDEX "enrollments__student_id_idx"
ON "enrollments" ("student_id");
CREATE INDEX "enrollments_course_id_idx"
ON "enrollments"  ("course_id");

--scan enrollments and courses
CREATE INDEX "course_id_idx"
ON "courses" ("id");
CREATE INDEX "course_department_number_semester_idx"
ON "courses" ("department", "number", "semester");
CREATE INDEX "course_title_idx"
ON "courses" ("title");

--scan students
CREATE INDEX "student_id_idx"
ON "students" ("id");
CREATE INDEX "student_name_idx"
ON "students" ("name");

--scan satisfies and courses
CREATE INDEX "satisfies_course_id_idx"
ON "satisfies" ("course_id");
CREATE INDEX "satisfies_requirement_id_idx"
ON "satisfies" ("requirement_id");

--scan requirements
CREATE INDEX "requirements_id_idx"
ON "requirements" ("id");
CREATE INDEX "requirements_name_idx"
ON "requirements" ("name");
