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
