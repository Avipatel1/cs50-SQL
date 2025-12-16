from cs50 import SQL
print("Hacked!")

db = SQL("sqlite:///dont-panic.db")
db.execute(
    """
    UPDATE "users"
    SET "password" = 'hacked!'
    WHERE "username" = 'admin';       
    """
)

password = input("Enter a password: ")
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';       
    """,
    password
)