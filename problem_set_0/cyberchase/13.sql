"""
write a SQL query to explore a question of your choice. This query should:
Involve at least one condition, using WHERE with AND or OR
"""

SELECT COUNT(DISTINCT("topic")) AS "distinct_topics" FROM "episodes";
