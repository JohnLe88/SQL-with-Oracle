
--John Le
--Student #:036123131


--CREATING TABLE FOR PROGRAM DATA
CREATE TABLE hr_program(
    prog_number CHAR(5) CONSTRAINT prog_num_nn NOT NULL,
    prog_name VARCHAR2(100) CONSTRAINT prog_number_nn NOT NULL
    );

--CREATING A UNIQUE KEY IN PROGRAM TABLE
CREATE UNIQUE INDEX program_prog_name_un
    ON hr_program(prog_name);


--CREATING TABLE FOR HALL DATA
CREATE TABLE hr_hall(
    hall_number VARCHAR2(5) CONSTRAINT hall_num_nn NOT NULL,
    hall_name VARCHAR2(100) CONSTRAINT hall_name_nn NOT NULL
    );

--CREATING UNIQUE INDEX FOR HALL NAME IN HALL TABLE
CREATE UNIQUE INDEX hall_hall_name_un
    ON hr_hall(hall_name);

    
--CREATING TABLE FOR STAFF DATA
CREATE TABLE hr_staff(
    staff_number CHAR(3) CONSTRAINT staff_num_nn NOT NULL,
    staff_salutation VARCHAR2(5),
    staff_lname VARCHAR2(30) CONSTRAINT staff_lname_nn NOT NULL,
    staff_fname VARCHAR2(30) CONSTRAINT staff_fname_nn NOT NULL
    );

      
--CREATING TABLE FOR COURSES DATA            
CREATE TABLE hr_course(
    crs_code CHAR(5) CONSTRAINT crs_code_nn NOT NULL,
    crs_name VARCHAR(50) CONSTRAINT crs_name_nn NOT NULL
    );

--CREATING UNIQUE INDEX IN COURSE TABLE
CREATE UNIQUE INDEX course_crs_name_un
    ON hr_course(crs_name);
  
            
--CREATING TABLE FOR DIVISION DATA
CREATE TABLE hr_division(
    div_number CHAR(3) CONSTRAINT div_num_nn NOT NULL,
    div_name VARCHAR2(50) CONSTRAINT div_name_nn NOT NULL,
    div_head CHAR(3) DEFAULT NULL
    );
    
--CREATING UNIQUE INDEX FOR DIVISION TABLE
CREATE UNIQUE INDEX division_div_name_un
    ON hr_division(div_name);
    
    
--CREATING TABLE FOR ADDRESS DATA    
CREATE TABLE hr_address(
    postal_code CHAR(3) CONSTRAINT postal_code_nn NOT NULL,
    place_name varchar2(200) DEFAULT NULL,
    province VARCHAR2(30) DEFAULT NULL
    );
     
            
--CREATING TABLE FOR STUDENT DATA    
CREATE TABLE hr_student(
    stud_number  NUMBER(5) CONSTRAINT stud_num_nn NOT NULL,
    stud_lname VARCHAR2(30) CONSTRAINT stud_lname_nn NOT NULL,
    stud_fname VARCHAR2(30) CONSTRAINT stud_fname_nn NOT NULL,
    stud_salutation  VARCHAR2(5),
    stud_address VARCHAR2(100),
    stud_postal_code CHAR(3),
    stud_dob_year NUMBER(4),
    hall_number VARCHAR2(5) CONSTRAINT stu_hall_num_nn NOT NULL,
    prog_number  CHAR(5) CONSTRAINT stu_prog_num_nn NOT NULL   
    );
   

--CREATING TABLE FOR DEPARTMENTS DATA
CREATE TABLE hr_department(
    dept_number CHAR(3) CONSTRAINT dept_num_nnn NOT NULL,
    dept_name VARCHAR2(100) CONSTRAINT dept_name_nnn NOT NULL,
    dept_head CHAR(3) CONSTRAINT dept_head_nnn NOT NULL,
    dept_div_number CHAR(3) CONSTRAINT dept_div_num_nnn NOT NULL
    );
    

--CREATING TABLE FOR PROGRAM STUCTURE DATA
CREATE TABLE hr_program_structure(
    ps_prog_number CHAR(5) CONSTRAINT ps_prog_num NOT NULL,
    ps_course_code CHAR(5) CONSTRAINT ps_course_code_nn NOT NULL,
    ps_course_seq_number NUMBER(3) DEFAULT 1 CONSTRAINT ps_course_seq_num_nn NOT NULL
    );

SAVE POINT script_table;
--SAVE POINT INCASE YOU ACCIDENTLY ALTER TABLE BEFORE POPULATING TABLES!


--WARNING! PLEASE POPULATE TABLE BEFORE ALTERING YOUR TABLES!!! OTHERWISE YOU CANNOT ALTER TABLES PROPERLY
PAUSE Please populate tables before altering tables!

--ALTERING TABLE TO ADD IN PRIMARY CONSTRAINT IN DIVISION TABLE
ALTER TABLE hr_division
    ADD( CONSTRAINT DIVISION_PK
            PRIMARY KEY(div_number)
            );    
    
--ALTERING TABLE TO ADD IN PRIMARY CONSTRAINT IN ADDRESS TABLE    
ALTER TABLE hr_address
    ADD( CONSTRAINT address_pk
            PRIMARY KEY(postal_code),
        CONSTRAINT postal_code_ck
            CHECK( LENGTH(postal_code) = 3)
            );
            

--ALTERING TABLE TO ADD IN CONSTRAINTS IN PROGRAM TABLE
ALTER TABLE hr_program 
    ADD( CONSTRAINT program_pk 
            PRIMARY KEY(prog_number)
            );

    
--ALTERING TABLE TO ADD IN CONSTRAINTS INTO HALL TABLE
ALTER TABLE hr_hall
    ADD( CONSTRAINT hall_pk
            PRIMARY KEY(hall_number)
            );    
            
    
--ALTERING TABLE TO ADD IN CONSTRAINTS INTO STAFF TABLE
ALTER TABLE hr_staff
    ADD( CONSTRAINT staff_pk
            PRIMARY KEY(staff_number),
        CONSTRAINT staff_num_ck
            CHECK (staff_number LIKE upper('s%')),
        CONSTRAINT staff_sal_ck
            CHECK (staff_salutation IN ('Mr.', 'Ms.', 'Miss', 'Hon.', 'Rev.', 'Prof.', 'Dr.'))
            );    
    
    
--ALTERING TABLE TO ADD IN PRIMARY CONSTRAINT IN COURSE TABLE
ALTER TABLE hr_course
    ADD( CONSTRAINT course_pk
            PRIMARY KEY(crs_code)
            );    
            
--ALTERING PROGRAM STRUCTURE TO ADD IN PRIMARY AND FOREIGN KEYS
ALTER TABLE hr_program_structure
    ADD( CONSTRAINT ps_prog_num_pk
            PRIMARY KEY(ps_course_code, ps_prog_number),
        CONSTRAINT ps_course_code_fk
            FOREIGN KEY(ps_course_code)
                REFERENCES hr_course(crs_code),
        CONSTRAINT ps_prog_num_fk
            FOREIGN KEY(ps_prog_number)
                REFERENCES hr_program(prog_number)
            );
    

--ALTERING STUDENT TABLE TO ADD IN PRIMARY AND FOREIGN KEYS
ALTER TABLE hr_student
    ADD( CONSTRAINT student_pk
            PRIMARY KEY(stud_number),
        CONSTRAINT stu_postal_code_fk
            FOREIGN KEY(stud_postal_code)
                REFERENCES hr_address(postal_code),
        CONSTRAINT stu_hall_num_fk
            FOREIGN KEY(hall_number)
                REFERENCES hr_hall(hall_number),
        CONSTRAINT stu_prog_num_fk
            FOREIGN KEY(prog_number)
                REFERENCES hr_program(prog_number),
        CONSTRAINT stud_dob_year_ck
            CHECK (stud_dob_year > 1900)
                );   
    
--ALTERING DEPARTMENTS TABLE TO ADD IN PRIMARY AND FOREIGN KEYS
ALTER TABLE hr_department
    ADD( CONSTRAINT department_pk
            PRIMARY KEY(dept_number),
        CONSTRAINT hr_dept_head_fk
            FOREIGN KEY(dept_head)
                REFERENCES hr_staff (staff_number),
        CONSTRAINT hr_dept_div_num_fk
            FOREIGN KEY(dept_div_number)
                REFERENCES hr_division (div_number)
                );
                
                
COMMIT;