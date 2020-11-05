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

CREATE TABLE IF NOT EXISTS tb_type_identification (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    type VARCHAR ( 40 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tb_patient (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR ( 40 ) NOT NULL ,
    last_name VARCHAR ( 40 ) NOT NULL ,
    phone CHAR ( 9 ) ,
    email VARCHAR ( 50 ),
    identification VARCHAR ( 20 ) NOT NULL ,
    id_gender INT NOT NULL ,
    id_type_identification INT NOT NULL ,
    FOREIGN KEY ( id_gender ) REFERENCES tb_gender ( id ) ,
    FOREIGN KEY ( id_type_identification ) REFERENCES tb_type_identification ( id )
);

CREATE TABLE IF NOT EXISTS tb_clinic_history (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    id_patient INT NOT NULL UNIQUE ,
    FOREIGN KEY ( id_patient ) REFERENCES tb_patient ( id )
);
-- GENERATE OTHER TABLES
CREATE TABLE IF NOT EXISTS tb_diagnosis (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    disease VARCHAR ( 50 ) NOT NULL ,
    id_doctor INT NOT NULL ,
    id_history_clinic INT NOT NULL ,
    FOREIGN KEY ( id_doctor ) REFERENCES tb_doctor ( id ) ,
    FOREIGN KEY ( id_history_clinic ) REFERENCES tb_clinic_history ( id )
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
    id_receptionist INT NOT NULL ,
    FOREIGN KEY ( id_receptionist ) REFERENCES tb_receptionist ( id )
);

CREATE TABLE IF NOT EXISTS tb_appointment (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    appointment_time TIME NOT NULL ,
    id_patient INT NOT NULL ,
    id_doctor INT NOT NULL ,
    id_receptionist INT NOT NULL ,
    FOREIGN KEY ( id_patient ) REFERENCES tb_patient ( id ) ,
    FOREIGN KEY ( id_doctor ) REFERENCES tb_doctor ( id ) ,
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

