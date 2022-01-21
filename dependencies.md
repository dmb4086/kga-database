# Functional Dependencies

{ plant_id } -> { planted_date, project_id, type_id, state_id }

{ project_id } -> { project_name, project_description }

{ type_id } -> { type_name, type_description, ailment_id, material_id }

{ ailment_id } -> { ailment_name, symptom_id, remedy_id }

{ symptom_id } -> { symptom_name, symptom_description }

{ remedy_id } -> { remedy_name, remedy_description }

{ material_id } -> { material_name, material_description }

{ state_id } -> { state_name, state_description }
