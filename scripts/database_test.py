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


def type_by_project(conn, project_number) -> None:
    """Prints the name and state of all plants in a project.

    :param conn: Connection object
    :param project_number: Int, project to query
    :return: None
    """
    cursor = conn.cursor()
    cursor.execute(
        "SELECT PR.name, PlantType.name, LC.name "
        "FROM PlantType "
        "JOIN Plant PL ON PlantType.type_id = PL.type_id "
        "JOIN LifeCycle LC ON PL.state_id = LC.state_id "
        "JOIN Project PR ON PL.project_id = PR.project_id "
        "WHERE PL.project_id = ?",
        (project_number,)
    )

    results = cursor.fetchall()

    for result in results:
        print(result)


def materials_by_plant(conn, plant_name) -> None:
    """Prints name and description of materials needed by plant

    :param conn: Connection object
    :param plant_name: str, name of plant
    :return: None
    """
    cursor = conn.cursor()
    cursor.execute(
        "SELECT PT.name, Material.name, Material.description "
        "FROM Material "
        "JOIN PlantType PT ON Material.material_id = PT.material_id "
        "WHERE PT.name LIKE ?",
        (plant_name,)
    )

    results = cursor.fetchall()

    for result in results:
        print(result)


def ailment_by_name(conn, ailment_name) -> None:
    """Prints symptoms and remedies by ailment name

    :param conn: Connection object
    :param ailment_name: str, name of the ailment to search
    :return: None
    """
    cursor = conn.cursor()
    cursor.execute(
        "SELECT Ailment.name, S.name, S.description, R.name, R.description "
        "FROM Ailment "
        "JOIN Symptom S ON S.symptom_id = Ailment.symptom_id "
        "JOIN Remedy R ON R.remedy_id = Ailment.remedy_id "
        "WHERE Ailment.name LIKE ?",
        (ailment_name,)
    )

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

    print("===== Example 1 =====")
    with connection:
        print("Prints all plant types in a project and their state.\n"
              "(Joins PlantType, Plant, LifeCycle, Project)")
        for project in range(1, 4):
            print("Project", project)
            type_by_project(connection, project)

    print("\n===== Example 2 =====")
    with connection:
        print("Show tools you will need by plant\n"
              "(Join Material and PlantType")
        plant_names = ['tomato', 'eggplant', 'pepper']
        for name in plant_names:
            materials_by_plant(connection, name)

    print("\n===== Example 3 =====")
    with connection:
        print("Show symptoms and remedies by ailment\n"
              "(Join Ailment, Symptom, and Remedy)")
        ailment_by_name(connection, "early blight")


if __name__ == '__main__':
    main()
