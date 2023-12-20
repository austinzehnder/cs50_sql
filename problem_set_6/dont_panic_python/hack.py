"""
write a Python program to achieve the following:

Connect, via Python, to a SQLite database.
Alter, within your Python program, the administrator’s password.
"""

from cs50 import SQL

db = SQL("sqlite:///dont-panic.db")
password = input("Enter a password: ")
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    password
)
