"""
Run this to reset
"""

--scanning enrollments
DROP INDEX "enrollments__student_id_idx";
DROP INDEX "enrollments_course_id_idx";

--scan enrollments and courses
DROP INDEX "course_id_idx";
DROP INDEX "course_department_number_semester_idx";
DROP INDEX "course_title_idx";

--scan students
DROP INDEX "student_id_idx";
DROP INDEX "student_name_idx";

--scan satisfies and courses
DROP INDEX "satisfies_course_id_idx";
DROP INDEX "satisfies_requirement_id_idx";

--scan requirements
DROP INDEX "requirements_id_idx";
DROP INDEX "requirements_name_idx";
