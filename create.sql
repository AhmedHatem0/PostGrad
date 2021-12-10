--create Database postgrad_office
create table PostGradUser(
ID int primary Key Identity,
email varchar(50),
password varchar(20))

create table admin(
ID int Primary key identity,
foreign key(ID) references PostGradUser)

create table GUCianStudent(
ID int primary key ,
first_name Varchar(20),
last_name varchar(20),
faculty varchar(20),
type Varchar(10),
GPA decimal,
address varchar(50),
UndergradID varchar(10),
foreign key(ID) references PostGradUser)

create table NonGUCianStudent(
ID int primary key ,
first_name Varchar(20),
last_name varchar(20),
faculty varchar(20),
type Varchar(10),
GPA decimal,
address varchar(50),
foreign key(ID) references PostGradUser)

create table GUCStudentPhoneNumber(
id int,
mobile_number varchar(20),
primary key(id,mobile_number),
foreign key(id) references GUCianStudent)

create table NonGUCStudentPhoneNumber(
id int,
mobile_number varchar(20),
primary key(id,mobile_number),
foreign key(id) references NonGUCianStudent)

create table Course( 
ID int primary key identity,
credit_hours int,
code varchar(10),
fees decimal)

create table supervisor(
ID int primary key ,
faculty varchar(20), 
name Varchar(20),
foreign key(ID) references PostGradUser )

create table payment (
ID int primary key,
num_installments int,
total_amount decimal,
fund_precentage decimal)

create table thesis (
serial_num int primary key,
field varchar(50),
start_date datetime ,
end_date datetime,
title varchar(50),
type varchar(50),
num_extensions int,
payment_ID int,
grade decimal,
defenseDate datetime,
years_spent as year(end_date) - year(start_date),
foreign key(payment_ID) references payment)

create table publication (
pubid int primary key identity,
title varchar(50),
host varchar(50),
place varchar(50),
pub_date datetime,
is_accepted bit)

create table examiner(
ID int primary key,
name varchar(20),
field_of_work varchar(20),
is_national bit
foreign key(ID) references PostGradUser)

create table defense(
date datetime,
serial_num int,
grade decimal,
location varchar(15),
primary key(date ,serial_num),
foreign key(serial_num) references thesis)

create table GucianProgressReport(
report_num int,
sid int,
date datetime,
evaluation int,
progress_state int,
serial_num int,
vid int,
description varchar(200),
primary key(report_num,sid),
foreign key(serial_num) references thesis,
foreign key(sid) references GUCianStudent,
foreign key(vid) references supervisor)

create table NonGucianProgressReport(
report_num int,
sid int,
date datetime,
evaluation int,
progress_state int,
serial_num int,
vid int,
description varchar(200),
primary key(report_num,sid),
foreign key(serial_num) references thesis,
foreign key(sid) references NonGUCianStudent,
foreign key(vid) references supervisor)

create table installment(
pid int,
date datetime,
status bit,
amount decimal,
primary key(date,pid),
foreign key(pid) references payment)

create table NonGucianStudentPayForCourse(
payment_num int,
sid int,
cid int,
Primary key(payment_num,sid,cid),
foreign key(payment_num) references Payment,
foreign key(sid) references NonGucianStudent,
foreign key(cid) references Course)

create table NonGucianStudentTakeCourse(
sid int,
cid int,
grade decimal,
primary key(sid,cid),
foreign key(sid) references NonGucianStudent,
foreign key(cid) references course)

create table GUCianStudentRegisterThesis(
sid int,
vid int,
serial_num int,
primary key(sid, vid, serial_num),
foreign key(sid) references GUCianStudent,
foreign key(vid) references supervisor,
foreign key(serial_num) references thesis)

create table NonGUCianStudentRegisterThesis(
sid int,
vid int,
serial_num int,
primary key(sid, vid, serial_num),
foreign key(sid) references NonGUCianStudent,
foreign key(vid) references supervisor,
foreign key(serial_num) references thesis)

create table ExaminerEvaluateDefense (
eid int,
date datetime,
serial_num int,
Comment varchar(300),
primary key(eid,date,serial_num),
foreign key(eid) references examiner,
foreign key(date,serial_num) references defense)

create table ThesisHasPublication(
serial_num int,
pubid int,
primary key(serial_num, pubid),
foreign key(serial_num) references thesis,
foreign key(pubid) references publication)
