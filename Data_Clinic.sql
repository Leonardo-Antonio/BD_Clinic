USE db_clinic;

INSERT INTO tb_turn ( turn )
VALUES
       ( "Mañana" ), ( "Tarde" ), ( "Noche" );

INSERT INTO tb_hour ( entry, departure, id_turn )
VALUES
       ( "08:00:00", "16:00:00", 1 ) ,
       ( "12:00:00", "20:00:00", 2 ) ,
       ( "18:00:00", "00:00:00", 3 ) ;

INSERT INTO tb_speciality ( speciality )
VALUES
       ( "Dermatología" ), ( "Ginecología" ) ,
       ( "Oftalmología" ), ( "Traumatología" ) ;

INSERT INTO tb_doctor ( name, last_name, id_hour, id_speciality )
VALUES
       ( "William", "Osler", 2, 1 ) ,
       ( "Ignaz", "Semmelweis", 1, 3 ),
       ( "Sigmund", "Freud", 1, 2 );

INSERT INTO tb_gender ( gender )
VALUES
       ( "Masculino" ), ( "Femenino" );

INSERT INTO tb_type_identification ( type )
VALUES
       ( "DNI" ), ( "Pasaporte" ), ( "Carnet de extrangeria" );

INSERT INTO tb_patient ( name, last_name, phone, email, identification, id_gender, id_type_identification )
VALUES
       ( "Alexandra Jaqueline", "Navarro Navarro", "999999999", null, "78965412", 2, 1 ) ,
       ( "Leonardo Antonio", "Nolasco Leyva", "996501260", "leo2001.nl8@gmail.com", "71062234", 1, 1 ) ;

INSERT INTO tb_clinic_history ( id_patient )
VALUES
       ( 1 );

INSERT INTO tb_diagnosis ( id_doctor, disease, id_history_clinic )
VALUES
       ( 2, "Gripe", 1 );

INSERT INTO tb_receptionist ( name, last_name, dni )
VALUES
       ( "Wichai", "Thongthan", "12345678" ) ,
       ( "Vernon", "Jordan", "96587412" ) ;

INSERT INTO tb_contrareferencia ( id_receptionist )
VALUES
       ( 2 ) ;

INSERT INTO tb_appointment ( appointment_time, id_patient, id_doctor, id_receptionist )
VALUES
        ( "08:30:00", 1, 1, 2 ) ,
        ( "14:30:00", 1, 1, 2 ) ,
        ( "16:30:00", 2, 2, 1 ) ;

INSERT INTO tb_cashier ( name, last_name, dni )
VALUES
        ( "Almirante Miguel", "Grau Seminario", "12344321" ) ;

INSERT INTO tb_proof_of_purchase ( id_appointment, id_cashier )
VALUES
        ( 2, 1 ), (3, 1) ;