DROP DATABASE IF EXISTS db_clinic;
CREATE DATABASE IF NOT EXISTS db_clinic;
USE db_clinic;

CREATE TABLE IF NOT EXISTS tb_turn (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    turn VARCHAR ( 20 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tb_hour (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    entry TIME NOT NULL ,
    departure TIME NOT NULL ,
    id_turn INT NOT NULL ,
    FOREIGN KEY ( id_turn ) REFERENCES tb_turn ( id )
);

CREATE TABLE IF NOT EXISTS tb_speciality (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    speciality VARCHAR ( 30 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tb_doctor (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR ( 40 ) NOT NULL ,
    last_name VARCHAR ( 40 ) NOT NULL ,
    id_hour INT NOT NULL ,
    id_speciality INT NOT NULL ,
    FOREIGN KEY ( id_hour ) REFERENCES tb_hour ( id ) ,
    FOREIGN KEY ( id_speciality ) REFERENCES tb_speciality ( id )
);

CREATE TABLE IF NOT EXISTS tb_gender (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    gender VARCHAR ( 20 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tb_marital_status (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    marital_status VARCHAR ( 40 ) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS tb_type_identification (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    type VARCHAR ( 40 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tb_health_insurance (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR ( 50 ) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS tb_clinic_history (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS tb_patient (
    id VARCHAR ( 30 ) NOT NULL PRIMARY KEY ,
    name VARCHAR ( 30 ) NOT NULL ,
    last_name VARCHAR ( 50 ) NOT NULL ,
    phone CHAR ( 9 ) ,
    email VARCHAR ( 50 ) ,
    birthdate DATE NOT NULL ,
    address VARCHAR ( 50 ) NOT NULL ,
    seguro BOOL NOT NULL DEFAULT FALSE ,
    hopital_perteneciente VARCHAR ( 50 ) ,
    id_type_identification INT NOT NULL ,
    id_gender INT NOT NULL ,
    id_marital_status INT NOT NULL ,
    id_clinic_history INT NOT NULL ,
    id_health_insurance INT NOT NULL ,
    FOREIGN KEY ( id_gender ) REFERENCES tb_gender ( id ) ,
    FOREIGN KEY ( id_type_identification ) REFERENCES tb_type_identification ( id ) ,
    FOREIGN KEY ( id_marital_status ) REFERENCES tb_marital_status ( id ) ,
    FOREIGN KEY ( id_clinic_history ) REFERENCES tb_clinic_history ( id ) ,
    FOREIGN KEY ( id_health_insurance ) REFERENCES tb_health_insurance ( id )
);
-- GENERATE OTHER TABLES
CREATE TABLE IF NOT EXISTS tb_diagnosis (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    reasons_for_consultation VARCHAR ( 80 ) NOT NULL ,
    current_illness VARCHAR ( 50 ) NOT NULL ,
    pathological_history VARCHAR ( 100 ) NOT NULL ,
    id_clinic_history INT NOT NULL ,
    FOREIGN KEY ( id_clinic_history ) REFERENCES tb_clinic_history( id )
);
-- FIN
CREATE TABLE IF NOT EXISTS tb_receptionist (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR ( 40 ) NOT NULL ,
    last_name VARCHAR ( 40 ) NOT NULL ,
    dni CHAR ( 8 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tb_contrareferencia (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    est_ref_name VARCHAR ( 50 ) NOT NULL ,
    est_ref_dir VARCHAR ( 80 ) NOT NULL ,
    est_contref_name VARCHAR ( 50 ) NOT NULL ,
    est_contref_dir VARCHAR ( 80 ) NOT NULL ,
    est_contref_diagnosis TEXT NOT NULL ,
    treatment VARCHAR ( 100 ) ,
    ind_aps VARCHAR ( 100 ) ,
    date_contref DATE NOT NULL ,
    id_patient VARCHAR ( 30 ) NOT NULL ,
    id_doctor INT NOT NULL ,
    id_receptionist INT NOT NULL ,
    FOREIGN KEY ( id_patient ) REFERENCES tb_patient ( id ) ,
    FOREIGN KEY ( id_doctor ) REFERENCES tb_doctor ( id ) ,
    FOREIGN KEY ( id_receptionist ) REFERENCES tb_receptionist ( id )
);

CREATE TABLE IF NOT EXISTS tb_appointment (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    hour TIME NOT NULL ,
    date DATE NOT NULL ,
    id_doctor INT NOT NULL ,
    id_patient VARCHAR ( 30 ) NOT NULL ,
    id_receptionist INT NOT NULL ,
    FOREIGN KEY ( id_doctor ) REFERENCES tb_doctor ( id ) ,
    FOREIGN KEY ( id_patient ) REFERENCES tb_patient ( id ) ,
    FOREIGN KEY ( id_receptionist ) REFERENCES tb_receptionist ( id )
);


CREATE TABLE IF NOT EXISTS tb_cashier (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR ( 40 ) NOT NULL ,
    last_name VARCHAR ( 40 ) NOT NULL ,
    dni CHAR ( 8 ) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS tb_proof_of_purchase (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    id_appointment INT NOT NULL UNIQUE ,
    id_cashier INT NOT NULL ,
    FOREIGN KEY ( id_appointment ) REFERENCES tb_appointment ( id ) ,
    FOREIGN KEY ( id_cashier ) REFERENCES tb_cashier ( id )
);

DROP DATABASE IF EXISTS db_clinic;
CREATE DATABASE IF NOT EXISTS db_clinic;
USE db_clinic;

CREATE TABLE IF NOT EXISTS tb_turn (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    turn VARCHAR ( 20 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tb_hour (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    entry TIME NOT NULL ,
    departure TIME NOT NULL ,
    id_turn INT NOT NULL ,
    FOREIGN KEY ( id_turn ) REFERENCES tb_turn ( id )
);

CREATE TABLE IF NOT EXISTS tb_speciality (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    speciality VARCHAR ( 30 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tb_doctor (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR ( 40 ) NOT NULL ,
    last_name VARCHAR ( 40 ) NOT NULL ,
    id_hour INT NOT NULL ,
    id_speciality INT NOT NULL ,
    FOREIGN KEY ( id_hour ) REFERENCES tb_hour ( id ) ,
    FOREIGN KEY ( id_speciality ) REFERENCES tb_speciality ( id )
);

CREATE TABLE IF NOT EXISTS tb_gender (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    gender VARCHAR ( 20 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tb_marital_status (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    marital_status VARCHAR ( 40 ) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS tb_type_identification (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    type VARCHAR ( 40 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tb_health_insurance (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR ( 50 ) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS tb_clinic_history (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS tb_patient (
    id VARCHAR ( 30 ) NOT NULL PRIMARY KEY ,
    name VARCHAR ( 30 ) NOT NULL ,
    last_name VARCHAR ( 50 ) NOT NULL ,
    phone CHAR ( 9 ) ,
    email VARCHAR ( 50 ) ,
    birthdate DATE NOT NULL ,
    address VARCHAR ( 50 ) NOT NULL ,
    seguro BOOL NOT NULL DEFAULT FALSE ,
    hopital_perteneciente VARCHAR ( 50 ) ,
    id_type_identification INT NOT NULL ,
    id_gender INT NOT NULL ,
    id_marital_status INT NOT NULL ,
    id_clinic_history INT NOT NULL ,
    id_health_insurance INT NOT NULL ,
    FOREIGN KEY ( id_gender ) REFERENCES tb_gender ( id ) ,
    FOREIGN KEY ( id_type_identification ) REFERENCES tb_type_identification ( id ) ,
    FOREIGN KEY ( id_marital_status ) REFERENCES tb_marital_status ( id ) ,
    FOREIGN KEY ( id_clinic_history ) REFERENCES tb_clinic_history ( id ) ,
    FOREIGN KEY ( id_health_insurance ) REFERENCES tb_health_insurance ( id )
);
-- GENERATE OTHER TABLES
CREATE TABLE IF NOT EXISTS tb_diagnosis (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    reasons_for_consultation VARCHAR ( 80 ) NOT NULL ,
    current_illness VARCHAR ( 50 ) NOT NULL ,
    pathological_history VARCHAR ( 100 ) NOT NULL ,
    id_clinic_history INT NOT NULL ,
    id_doctor INT NOT NULL ,
    FOREIGN KEY ( id_clinic_history ) REFERENCES tb_clinic_history( id ) ,
    FOREIGN KEY ( id_doctor ) REFERENCES tb_doctor( id )
);
-- FIN
CREATE TABLE IF NOT EXISTS tb_receptionist (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR ( 40 ) NOT NULL ,
    last_name VARCHAR ( 40 ) NOT NULL ,
    dni CHAR ( 8 ) NOT NULL UNIQUE ,
    password VARCHAR ( 30 ) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_contrareferencia (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    est_ref_name VARCHAR ( 50 ) NOT NULL ,
    est_ref_dir VARCHAR ( 80 ) NOT NULL ,
    est_contref_name VARCHAR ( 50 ) NOT NULL ,
    est_contref_dir VARCHAR ( 80 ) NOT NULL ,
    est_contref_diagnosis TEXT NOT NULL ,
    treatment VARCHAR ( 100 ) ,
    ind_aps VARCHAR ( 100 ) ,
    date_contref DATE NOT NULL ,
    id_patient VARCHAR ( 30 ) NOT NULL ,
    id_doctor INT NOT NULL ,
    id_receptionist INT NOT NULL ,
    FOREIGN KEY ( id_patient ) REFERENCES tb_patient ( id ) ,
    FOREIGN KEY ( id_doctor ) REFERENCES tb_doctor ( id ) ,
    FOREIGN KEY ( id_receptionist ) REFERENCES tb_receptionist ( id )
);

CREATE TABLE IF NOT EXISTS tb_appointment (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    hour TIME NOT NULL ,
    date DATE NOT NULL ,
    id_patient VARCHAR ( 30 ) NOT NULL ,
    id_receptionist INT NOT NULL ,
    id_doctor INT NOT NULL ,
    FOREIGN KEY ( id_patient ) REFERENCES tb_patient ( id ) ,
    FOREIGN KEY ( id_receptionist ) REFERENCES tb_receptionist ( id ) ,
    FOREIGN KEY ( id_doctor ) REFERENCES tb_doctor ( id )
);


CREATE TABLE IF NOT EXISTS tb_cashier (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR ( 40 ) NOT NULL ,
    last_name VARCHAR ( 40 ) NOT NULL ,
    dni CHAR ( 8 ) NOT NULL UNIQUE ,
    password VARCHAR ( 30 ) NOT NULL
);


CREATE TABLE IF NOT EXISTS tb_proof_of_purchase (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    id_appointment INT NOT NULL UNIQUE ,
    id_cashier INT NOT NULL ,
    FOREIGN KEY ( id_appointment ) REFERENCES tb_appointment ( id ) ,
    FOREIGN KEY ( id_cashier ) REFERENCES tb_cashier ( id )
);

