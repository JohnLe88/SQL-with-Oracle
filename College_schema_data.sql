--John Le
--Student #:036123131



create sequence stu_id_seq
    increment by 5
    start with 100
    maxvalue 1000
    nocache
    nocycle;

insert into hr_student values(stu_id_seq.nextval, 'Foster', 'Bruce', 'Mr.', '1168 Queen St E', 'M4M', 'BSC1', 'Chan', 1978);
insert into hr_student values(stu_id_seq.nextval, 'Jones', 'Bruce', 'Ms.', '211 Martindale Rd', 'L2S', 'BSC2', 'Chan', 1970);
insert into hr_student values(stu_id_seq.nextval, 'James', 'Enos', 'Ms.', '1383 Wilson Rd N', 'L1K', 'BSC1', 'Urv', 1966);
insert into hr_student values(stu_id_seq.nextval, 'James', 'Yvonne', 'Ms.', '27 King Ave E', 'L1B', 'BSC1', 'Mars', 1970);
insert into hr_student values(stu_id_seq.nextval, 'Douglas', 'Henry', 'Prof.', '55 Bloor St W', 'M4W', 'BSC2', 'Urv', 1970);
insert into hr_student values(stu_id_seq.nextval, 'Henry', 'Suzanne', 'Hon.', '13162 Yonge St', 'L4E', 'BSC2', 'Urv', 1928);
insert into hr_student values(stu_id_seq.nextval, 'Lambert', 'Cecille', 'Rev.', '2155 Leanne Blvd unit #104', 'L5K', 'BSC5', 'Mars', 1978);

set define off;
insert into hr_program values('BSC1', 'Bachelor of Science in MIS');
insert into hr_program values('BSC2', 'Bachelor of Science in Computer Science');
insert into hr_program values('BSC3', 'Bachelor of Science in Electronic Engineering');
insert into hr_program values('BSC4', 'Bachelor of Science in Mathematics');
insert into hr_program values('BSC5', 'Bachelor of Science in Computer Science & Mathematics');
insert into hr_program values('BSC6', 'Bachelor of Science in Computer Science & Electronics');
insert into hr_program values('BSC7', 'Bachelor of Science in Chemistry');
insert into hr_program values('BSC8', 'Bachelor of Science in Physics');

insert into hr_department values('MTH', 'Department of Mathematics', 'S10', 'D01');
insert into hr_department values('CSC', 'Department of Computer Science', 'S15', 'D01');
insert into hr_department values('PHY', 'Department of Physics', 'S05', 'D01');
insert into hr_department values('MGT', 'Department of Management Studies', 'S20', 'D01');
insert into hr_department values('MSC', 'Department of Music', 'S30', 'D02');


insert into hr_course values('CS100', 'Introduction to Computer Science');
insert into hr_course values('CS210', 'Data Structure');
insert into hr_course values('CS220', 'Visual Programming');
insert into hr_course values('CS330', 'Software Engineering');
insert into hr_course values('CS360', 'Database Systems');

insert into hr_course values('M100', 'Calculus I');
insert into hr_course values('M110', 'Mechanics');
insert into hr_course values('M200', 'Calculus II');
insert into hr_course values('M210', 'Linear Algebra');

insert into hr_hall values('Chan', 'Chancellor Hall');
insert into hr_hall values('Len', 'Lenhiem Hall');
insert into hr_hall values('Mars', 'Mary Seacole Hall');
insert into hr_hall values('Urv', 'Urvine Hall');


insert into hr_staff values('S05', 'Prof.', 'Farr', 'Christine');
insert into hr_staff values('S10', 'Dr.', 'Phillips', 'Paul');
insert into hr_staff values('S15', 'Dr.', 'Foster', 'Scott');
insert into hr_staff values('S20', 'Prof.', 'Gaur', 'Hans');
insert into hr_staff values('S25', 'Dr.', 'Lambert', 'Bruce');
insert into hr_staff values('S30', 'Dr.', 'Henry', 'Carolyn');
insert into hr_staff values('S35', 'Dr.', 'Armstrong', 'Enid');
insert into hr_staff values('S40', 'Dr.', 'Golding', 'Calvin');


insert into hr_program_structure values('BSC1', 'M100', 01);
insert into hr_program_structure values('BSC1', 'M200', 02);
insert into hr_program_structure values('BSC1', 'CS100', 03);
insert into hr_program_structure values('BSC1', 'CS210', 04);
insert into hr_program_structure values('BSC1', 'CS220', 05);

insert into hr_program_structure values('BSC2', 'CS100', 01);
insert into hr_program_structure values('BSC2', 'CS210', 02);
insert into hr_program_structure values('BSC2', 'CS220', 03);

insert into hr_program_structure values('BSC2', 'M100', 16);

insert into hr_division values('D01', 'Division of Pure & Applied Sciences', 'S25');
insert into hr_division values('D02', 'Division of Arts & Humanities', 'S25');
insert into hr_division values('D03', 'Division of Education & Psychology', 'S25');

drop sequence stu_id_seq;

COMMIT;


