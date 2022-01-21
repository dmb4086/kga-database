-- Create a test table to validate creation method
CREATE TABLE Test
(
    test_id   INTEGER PRIMARY KEY,
    test_name TEXT NOT NULL
);

-- Some test data to read
INSERT INTO Test (test_name)
VALUES ('A Test');
INSERT INTO Test (test_name)
VALUES ('Another Test');

-- Create tables for plants
CREATE TABLE Symptom
(
    symptom_id  INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    description TEXT
);

CREATE TABLE Remedy
(
    remedy_id   INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    description TEXT
);

CREATE TABLE Ailment
(
    ailment_id INTEGER PRIMARY KEY,
    name       TEXT    NOT NULL,
    remedy_id  INTEGER NOT NULL,
    symptom_id INTEGER NOT NULL,
    CONSTRAINT fk_remedy
        FOREIGN KEY (remedy_id)
            REFERENCES Remedy (remedy_id),
    CONSTRAINT fk_symptom
        FOREIGN KEY (symptom_id)
            REFERENCES Symptom (symptom_id)
);

CREATE TABLE Material
(
    material_id INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    description TEXT
);

CREATE TABLE PlantType
(
    type_id     INTEGER PRIMARY KEY,
    name        NAME    NOT NULL,
    description TEXT,
    ailment_id  INTEGER NOT NULL,
    material_id INTEGER NOT NULL,
    CONSTRAINT fk_ailment
        FOREIGN KEY (ailment_id)
            REFERENCES Ailment (ailment_id),
    CONSTRAINT fk_material
        FOREIGN KEY (material_id)
            REFERENCES Material (material_id)
);

CREATE TABLE Project
(
    project_id  INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    description TEXT
);

CREATE TABLE Plant
(
    plant_id   INTEGER PRIMARY KEY,
    planted_date DATE,
    project_id INTEGER NOT NULL,
    type_id    INTEGER NOT NULL,
    CONSTRAINT fk_project
        FOREIGN KEY (project_id)
            REFERENCES Project (project_id),
    CONSTRAINT fk_type
        FOREIGN KEY (type_id)
            REFERENCES PlantType (type_id)
);
