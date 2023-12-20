"""
write SQL query to answer a question of your choice. This query should:
Make use of AS to rename a column
Involve at least condition, using WHERE
Sort by at least one column using ORDER BY
"""

SELECT COUNT("id") AS "Player Count"
FROM "players"
WHERE "bats" = 'R'
ORDER BY "birth_state";
