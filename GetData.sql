USE db_clinic;

SELECT * FROM tb_turn;
SELECT * FROM tb_hour;
SELECT * FROM tb_speciality;

SELECT tb_doctor.id, CONCAT(tb_doctor.name, " ", tb_doctor.last_name) 'Nombres y apellidos',
       tb_hour.entry, tb_hour.departure,
       tb_turn.turn,
       tb_speciality.speciality
FROM tb_doctor
LEFT JOIN tb_turn
ON ( tb_doctor.id = tb_turn.id)
LEFT JOIN tb_hour
ON ( tb_doctor.id = tb_hour.id)
LEFT JOIN tb_speciality
ON ( tb_doctor.id = tb_speciality.id);

SELECT * FROM tb_gender;
SELECT * FROM tb_type_identification;

SELECT tb_patient.id, CONCAT(tb_patient.name, " ", tb_patient.last_name) 'Nombres y apellidos',
       tb_patient.phone, tb_patient.email, tb_patient.identification,
       tb_gender.gender,
       tb_type_identification.type
FROM tb_patient
LEFT JOIN tb_gender
ON ( tb_patient.id_gender = tb_gender.id )
LEFT JOIN tb_type_identification
ON ( tb_patient.id_gender = tb_type_identification.id );

SELECT tb_clinic_history.id,
       CONCAT(tb_patient.name, " ", tb_patient.last_name) 'Nombres y apellidos',
       tb_patient.email, tb_type_identification.type, tb_patient.identification
FROM tb_clinic_history
LEFT JOIN tb_patient
ON ( tb_clinic_history.id = tb_patient.id )
LEFT JOIN tb_type_identification
ON ( tb_patient.id = tb_type_identification.id );

SELECT tb_diagnosis.id, tb_diagnosis.disease ,
       CONCAT( tb_doctor.name, " ", tb_doctor.last_name ) 'nombres y apellidos',
       id_history_clinic
FROM tb_diagnosis
LEFT JOIN tb_doctor
ON ( tb_diagnosis.id_doctor = tb_doctor.id );

SELECT * FROM tb_receptionist;
SELECT * FROM tb_contrareferencia;

SELECT tb_a.id, tb_a.appointment_time,
       CONCAT( tb_patient.name, " ", tb_patient.last_name ) 'Paciente',
       CONCAT( tb_doctor.name, " ", tb_doctor.last_name ) 'Doctor', turn,
       CONCAT( tb_receptionist.name, " ", tb_receptionist.last_name ) 'Recepcionista'
FROM tb_appointment tb_a
LEFT JOIN tb_patient
ON ( tb_a.id_patient = tb_patient.id )
LEFT JOIN tb_doctor
ON ( tb_a.id_doctor = tb_doctor.id )
LEFT JOIN tb_receptionist
ON ( tb_a.id_receptionist = tb_receptionist.id )
LEFT JOIN tb_hour
ON ( tb_doctor.id = tb_hour.id  )
LEFT JOIN tb_turn
ON ( tb_hour.id_turn = tb_turn.id );


SELECT * FROM tb_cashier;
SELECT * FROM tb_appointment
LEFT JOIN tb_patient
ON ( tb_appointment.id = tb_patient.id );

SELECT tb_pop.id,
       tb_appointment.appointment_time,
       tb_speciality.speciality,
       tb_turn.turn
FROM tb_proof_of_purchase tb_pop
INNER JOIN tb_appointment
ON ( tb_pop.id_appointment = tb_appointment.id )
LEFT JOIN tb_patient
ON ( tb_appointment.id = tb_patient.id )
LEFT JOIN tb_doctor
ON ( tb_appointment.id_doctor = tb_doctor.id )
LEFT JOIN tb_speciality
ON ( tb_doctor.id_speciality = tb_speciality.id )
LEFT JOIN tb_hour
ON ( tb_doctor.id_hour = tb_hour.id )
LEFT JOIN tb_turn
ON ( tb_hour.id_turn = tb_turn.id )