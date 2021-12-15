--drop database postgrad_office
create Database postgrad_office
go
use postgrad_office
create table PostGradUser(
ID int primary Key Identity,
email varchar(50),
password varchar(20))

create table admin(
ID int Primary key,
foreign key(ID) references PostGradUser on delete cascade on update cascade)

create table GUCianStudent(
ID int primary key,
first_name Varchar(20),
last_name varchar(20),
faculty varchar(20),
type Varchar(10),
GPA decimal(5,2),
address varchar(50),
UndergradID varchar(10),
foreign key(ID) references PostGradUser on delete cascade on update cascade)

create table NonGUCianStudent(
ID int primary key ,
first_name Varchar(20),
last_name varchar(20),
faculty varchar(20),
type Varchar(10),
GPA numeric(5,2),
address varchar(50),
foreign key(ID) references PostGradUser on delete cascade on update cascade)

create table GUCStudentPhoneNumber(
id int,
mobile_number varchar(20),
primary key(id,mobile_number),
foreign key(id) references GUCianStudent on delete cascade on update cascade)

create table NonGUCStudentPhoneNumber(
id int,
mobile_number varchar(20),
primary key(id,mobile_number),
foreign key(id) references NonGUCianStudent on delete cascade on update cascade)

create table Course( 
ID int primary key identity,
credit_hours int,
code varchar(10),
fees decimal(15,2))

create table supervisor(
ID int primary key ,
faculty varchar(20), 
name Varchar(20),
foreign key(ID) references PostGradUser on delete cascade on update cascade)

create table payment (
ID int primary key identity,
num_installments int,
total_amount decimal(15,2),
fund_precentage decimal(5,2))

create table thesis (
serial_num int primary key identity,
field varchar(50),
start_date date,
end_date date,
title varchar(50),
type varchar(50),
num_extensions int,
payment_ID int,
grade decimal(5,2),
defenseDate datetime,
years_spent as year(end_date) - year(start_date),
foreign key(payment_ID) references payment on delete cascade on update cascade)

create table publication (
pubid int primary key identity,
title varchar(50),
host varchar(50),
place varchar(50),
pub_date date,
is_accepted bit)

create table examiner(
ID int primary key,
name varchar(20),
field_of_work varchar(20),
is_national bit
foreign key(ID) references PostGradUser on delete cascade on update cascade)

create table defense(
date datetime,
serial_num int,
grade decimal(5,2),
location varchar(15),
primary key(date ,serial_num),
foreign key(serial_num) references thesis on delete cascade on update cascade)

create table GucianProgressReport(
report_num int identity,
sid int,
date date,
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
report_num int identity,
sid int,
date date,
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
amount decimal(15,2),
primary key(date,pid),
foreign key(pid) references payment on delete cascade on update cascade)

create table NonGucianStudentPayForCourse(
payment_num int,
sid int,
cid int,
Primary key(payment_num,sid,cid),
foreign key(payment_num) references Payment on delete cascade on update cascade,
foreign key(sid) references NonGucianStudent on delete cascade on update cascade,
foreign key(cid) references Course on delete cascade on update cascade)

create table NonGucianStudentTakeCourse(
sid int,
cid int,
grade decimal(5,2),
primary key(sid,cid),
foreign key(sid) references NonGucianStudent on delete cascade on update cascade,
foreign key(cid) references course on delete cascade on update cascade)

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
foreign key(eid) references examiner on delete cascade on update cascade,
foreign key(date,serial_num) references defense on delete cascade on update cascade)

create table ThesisHasPublication(
serial_num int,
pubid int,
primary key(serial_num, pubid),
foreign key(serial_num) references thesis on delete cascade on update cascade,
foreign key(pubid) references publication on delete cascade on update cascade)
 
