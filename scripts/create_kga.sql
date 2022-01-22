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

CREATE TABLE LifeCycle
(
    state_id    INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    description TEXT
);

CREATE TABLE Plant
(
    plant_id     INTEGER PRIMARY KEY,
    planted_date DATE,
    project_id   INTEGER NOT NULL,
    type_id      INTEGER NOT NULL,
    state_id     INTEGER NOT NULL,
    CONSTRAINT fk_project
        FOREIGN KEY (project_id)
            REFERENCES Project (project_id),
    CONSTRAINT fk_type
        FOREIGN KEY (type_id)
            REFERENCES PlantType (type_id),
    CONSTRAINT fk_state
        FOREIGN KEY (state_id)
            REFERENCES LifeCycle (state_id)
);

-- Add some symptoms
INSERT INTO Symptom (symptom_id, name, description)
VALUES (1, 'Dark Spots', 'Dark spots with concentric rings develop on older leaves first that touch infected soil.');

-- Add some remedies
INSERT INTO Remedy (remedy_id, name, description)
VALUES (1, 'Remove', 'Remove affected plants and thoroughly clean fall garden debris. Do not compost affected plants.');

-- Add some ailments
INSERT INTO Ailment (ailment_id, name, remedy_id, symptom_id)
VALUES (1, 'Early Blight', 1, 1);

-- Add materials
INSERT INTO Material (material_id, name, description)
VALUES (1, 'Trowel', 'A small handheld shovel or spade.');
INSERT INTO Material (material_id, name, description)
VALUES (2, 'Pruning Shears',
        'Hand pruners, also called secateurs, help reign in plants that are getting out of control and taking over.');
INSERT INTO Material (material_id, name, description)
VALUES (3, 'Watering Can',
        'There are 2 basic types of watering cans, plastic or metal. There are hundreds of styles, colors, sizes and nozzle options.');

-- Add types
INSERT INTO PlantType (type_id, name, description, ailment_id, material_id)
VALUES (1, 'Tomato', 'Some kind of fruit, eh.', 1, 1);
INSERT INTO PlantType (type_id, name, description, ailment_id, material_id)
VALUES (2, 'Pepper', 'Another kind of fruit, eh.', 1, 2);
INSERT INTO PlantType (type_id, name, description, ailment_id, material_id)
VALUES (3, 'Eggplant',
        'The eggplant is a delicate, tropical perennial plant often cultivated as a tender or half-hardy annual in temperate climates.',
        1, 3);

-- Add projects
INSERT INTO Project (project_id, name, description)
VALUES (1, 'Project One', 'This is project one');
INSERT INTO Project (project_id, name, description)
VALUES (2, 'Project Two', 'This is project two');
INSERT INTO Project (project_id, name, description)
VALUES (3, 'Project Three', 'This is project three');

-- Add lifecycle states
INSERT INTO LifeCycle (state_id, name)
VALUES (1, 'Germination');
INSERT INTO LifeCycle (state_id, name)
VALUES (2, 'Seedling');
INSERT INTO LifeCycle (state_id, name)
VALUES (3, 'Adult Plant');

-- Add some plants
INSERT INTO Plant (plant_id, planted_date, project_id, type_id, state_id)
VALUES (1, 20220121, 1, 1, 3);
INSERT INTO Plant (plant_id, planted_date, project_id, type_id, state_id)
VALUES (2, 20220121, 2, 2, 2);
INSERT INTO Plant (plant_id, planted_date, project_id, type_id, state_id)
VALUES (3, 20220121, 3, 3, 1);