# Relational Notation

Symptom(__symptom_id__, name, description)

Remedy(__remedy_id__, name, description)

Ailment(__ailment_id__, name, *remedy_id*, *symptom_id*)

Material(__material_id__, name, description)

PlantType(__type_id__, name, description, *ailment_id*, *material_id*)

Project(__project_id__, name, description)

Plant(__plant_id__, planted_date, *project_id*, *type_id*)
