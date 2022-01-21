import os.path
import sqlite3
import sys


def create_connection(database_file) -> sqlite3.Connection:
    """Creates connection to SQLite database

    :param database_file: path to database
    :return: Database connection object
    """
    connection = None
    try:
        connection = sqlite3.connect(database_file)
    except ConnectionError:
        print('Something went wrong while connecting')
        exit(1)

    return connection


def select_test(conn) -> None:
    """Temporary test to validate python connection to SQLite3 DB
    FIXME: Remove this from final script.
    :param conn: connection object
    :return: None
    """
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM test")

    results = cursor.fetchall()

    for result in results:
        print(result)


def main():
    if len(sys.argv) != 2:
        # Make sure a path to the database file is provided
        print("Please include the database file path as the only argument.")
        exit(1)
    elif not os.path.isfile(sys.argv[1]):
        # Check that file exists
        print("No database at provided path.")
        exit(1)

    connection = create_connection(sys.argv[1])  # Create connection object

    with connection:
        # Test connection to db FIXME: Remove
        print('Selecting from test:')
        select_test(connection)


if __name__ == '__main__':
    main()
