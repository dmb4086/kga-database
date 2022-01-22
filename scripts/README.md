# KGA Database

A guide to creating and testing our Exercise 1 submission.

## Creating the Database

To create the database, simply run this command from within `kga-database/scripts`.

```bash
sqlite3 kga.sqlt < create_kga.sql
```

## Testing Script

The testing script is written python and can be run from this folder with the following command. This script only makes
use of libraries bundled in Python.

```bash
python3 database_test.py kga.sqlt
```

If running from another location replace `kga.sqlt` with the path to the database file you wish to target.

## Script Example Queries

These are the demo queries executed in the Python Script. However, in the script the where clauses are not hard coded
into the query and instead passed to the function that executes the query.

### Example 1

Show all plant types and their states in a given project.

```sqlite
SELECT PR.name, PlantType.name, LC.name
FROM PlantType
         JOIN Plant PL ON PlantType.type_id = PL.type_id
         JOIN LifeCycle LC ON PL.state_id = LC.state_id
         JOIN Project PR ON PL.project_id = PR.project_id
WHERE PL.project_id = 1;
```

### Example 2

Show what materials you will need for a given plant.

```sqlite
SELECT PT.name, Material.name, Material.description
FROM Material
         JOIN PlantType PT ON Material.material_id = PT.material_id
WHERE PT.name LIKE 'Eggplant';
```

### Example 3

Show symptoms and remedies given an ailment name.

```sqlite
SELECT Ailment.name, S.name, S.description, R.name, R.description
FROM Ailment
         JOIN Symptom S ON S.symptom_id = Ailment.symptom_id
         JOIN Remedy R ON R.remedy_id = Ailment.remedy_id
WHERE Ailment.name LIKE 'Early Blight';
```