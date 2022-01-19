-- Create a test table to validate creation method
CREATE TABLE test
(
    test_id   INTEGER PRIMARY KEY,
    test_name TEXT NOT NULL
);

-- Some test data to read
INSERT INTO test (test_name)
VALUES ('A Test');
INSERT INTO test (test_name)
VALUES ('Another Test');

-- Create plant type
CREATE TABLE plant_type (
    id INTEGER PRIMARY KEY,
    type TEXT NOT NULL
);

-- Add material table
CREATE TABLE material (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

-- Add required tables for ailment
-- symptom
CREATE TABLE symptom (
    id INTEGER PRIMARY KEY,
    symptom TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE remedy (
    id INTEGER PRIMARY KEY,
    symptom TEXT NOT NULL,
    description TEXT NOT NULL
);
