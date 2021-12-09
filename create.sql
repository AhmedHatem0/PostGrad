
create Database Postgrad_office
 go
use Postgrad_office


create table student(
ID int primary key Identity,
first_name Varchar(20),
last_name varchar(20),
email varchar(50),
faculty varchar(20),
type Int,
GPA decimal(3,2),
address varchar(10),
password varchar(20))

create table student_mobile(
sid int,
mobile_number varchar(20),
primary key(sid,mobile_number),
foreign key(sid) references student on delete cascade)

create table GUCian (
ID int primary key ,
undergrad_ID int,
foreign key(ID) references Student)

create table non_GUCian(
ID int primary key,
foreign key(ID) references student)
create table course( ID int primary key,
credit_hours int,
code varchar(50),
fees int)

create table thesis (
serial_num varchar(50) primary key,
field varchar(50),
start_date datetime ,
end_date datetime,
title varchar(50),
type varchar(50),
num_extensions int,
years_spent as year(end_date) -year(start_date))

create table payment (
ID int primary key,
num_installments int,
total_amount int,
fund_precentage int ,
serial_num varchar(50),
foreign key(serial_num) references thesis on delete cascade)

create table installment(
installment_num int,
pid int,
date datetime,
status bit,
amount int,
primary key(installment_num,pid),
foreign key(pid) references payment on delete cascade )

create table supervisor(
ID int primary key ,
faculty varchar(20), 
first_name Varchar(20),
last_name varchar(20),
email varchar(50),
password varchar(20),
address varchar(10))

create table publication (
title varchar(50) primary key,
host varchar(50),
place varchar(50),
date datetime ,
is_accepted bit,
sid int,
pid int ,
foreign key(sid) references student on delete cascade,
foreign key(pid) references payment on delete cascade)

create table defense(
date datetime ,
serial_num varchar(50),
grade decimal,
location varchar(50),
sid int ,
primary key(date ,serial_num),
foreign key(serial_num) references thesis on delete cascade ,
foreign key(sid) references student on delete cascade)

create table examiner(
ID int primary key,
name varchar(50),
field_of_work varchar(50),
is_national bit)

create table progress_report(
report_num int,
serial_num varchar(50),
date datetime,
description varchar(50),
evaluation int,
progress_state int ,
sid int,
vid int,
primary key(report_num,serial_num),
foreign key(serial_num) references thesis on delete no action,
foreign key(sid) references student  on delete no action,
foreign key(vid) references supervisor on delete no action)

create table make_under_supervision(
sid int,
vid int,
serial_num varchar(50) primary key,
foreign key(sid) references student on delete no action,
foreign key(vid) references supervisor on delete no action,
foreign key(serial_num) references thesis on delete no action)

create table take_course(
sid int ,
cid int ,
grade varchar(50),
primary key(sid,cid),
foreign key(sid) references student on delete cascade,
foreign key(cid) references course on delete cascade)

create table publicaton_of_thesis(
serial_num varchar(50),
title varchar(50),
primary key(serial_num, title),
foreign key(serial_num) references thesis on delete no action,
foreign key(title) references publication on delete no action)

create table evaluates (
eid int,
date datetime,
serial_num varchar(50),
comment varchar(300),
primary key(eid,date,serial_num),
foreign key(eid) references examiner on delete cascade,
foreign key(date,serial_num) references defense on delete cascade)

create table NonGUCian_pay_for_Course(
payment_num int,
sid int,
cid int,
Primary key(payment_num,sid,cid),
foreign key(payment_num) references Payment,
foreign key(sid) references Non_GUCian,
foreign key(cid) references Course)

