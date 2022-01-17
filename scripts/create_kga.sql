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
