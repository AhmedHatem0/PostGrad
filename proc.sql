
-- 1 a) 
create Proc StudentRegister 
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@Gucian bit,
@email varchar(50),
@address varchar(50)
as 
Insert Into Student (first_name,last_name,password,faculty,email,address) 
values (@first_name,@last_name,@password,@faculty,@email,@address)
Declare @ID int
select @ID = ID from student where email = @email
IF @gucian = 1 Insert Into GUCian(ID) values (@ID)
else Insert Into non_GUCian(ID) values (@ID)

go
--1a.2
create proc SupervisorRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@email varchar(50) 
as 
insert into PostGradUser(email,password) values(@email,@password)
insert into supervisor values(IDENT_CURRENT('PostGradUser'),@faculty,@first_name+' '+@last_name);


go
-- create proc SupervisorRegister

-- 2 a)

--2 registered user
--a
--user login with username and password, returning a success bit

go

CREATE FUNCTION userLogin (@ID int, @password varchar(20))
RETURNS bit
AS
begin
	declare @ret bit
    if (exists( 
	select *
	from postGradUser U
	where U.ID = @ID and U.password = @password
	))
	set @ret = '1';
	else 
	set @ret = '0';
	return @ret;
end;

-- 2 b)
go
--b
--given the ID of the user and his mobile number, it adds it to the database

create proc addMobile
@ID int, @mobile_number varchar(20)
as
if(exists(select * from GucianStudent G where G.id = @ID)) 
insert into GUCStudentPhoneNumber Values(@ID,@mobile_number);
else
insert into NonGUCStudentPhoneNumber Values(@ID,@mobile_number);

-- 3 a) 
go 
create proc AdminListSup
As 
select * from supervisor

-- 3 b)
go
create proc AdminViewSupervisorProfile
@supId int
as 
select * from supervisor 
where id = @supId

-- 3 c)
go
create proc AdminViewAllTheses 
As
Select * from thesis

-- 3 d)
go
create proc AdminViewOnGoingTheses
@thesesCount int output
as
select @thesesCount = count(*) from thesis
where current_timestamp >= start_date and 
(end_date is null or current_timestamp <= end_date)

-- 3 e)
go
create proc AdminViewStudentThesisBySupervisor
As 
Select sv.first_name +sv.last_name as 'Supervisor name', t.title , std.first_name + std.last_name as 'Student name'
from supervisor sv inner join make_under_supervision mus on sv.ID = mus.vid 
inner join student std on std.ID = mus.sid 
inner join thesis t on t.serial_num = mus.serial_num 

-- 3 f)
go
create proc AdminListNonGucianCourse
@courseID int
as
select s.first_name+' '+s.last_name as name, c.code, t.grade 
from student s, take_course t, course c
where s.ID = t.sid and c.ID = t.cid and t.cid = @courseID

-- 3 g)
go
create proc AdminUpdateExtension
@ThesisSerialNo int 
as 
update thesis 
set thesis.num_extensions += 1 where thesis.serial_num = @ThesisSerialNo

-- 3 h)
go
create proc AdminIssueThesisPayment
@ThesisSerialNo int,
@amount decimal,
@noOfInstallments int,
@fundPercentage decimal,
@success bit output
as
if @ThesisSerialNo is null or @amount is null or @noOfInstallments is null or @fundPercentage is null
set @success = 0
else
set @success = 1
insert into payment (serial_num, total_amount, num_installments, fund_precentage) 
values (@ThesisSerialNo, @amount, @noOfInstallments, @fundPercentage)

-- 3 i)
go
create proc AdminViewStudentProfile
@sid Int 
As
select * from student where student.ID = @sid

-- 3 j)
go
create proc AdminIssueInstallPayment
@paymentID int, 
@InstallStartDate date
as
declare @cnt int
declare @amount int
declare @sum int
declare @date date
set @date = @InstallStartDate
select @cnt = num_installments from payment where ID = @paymentID
select @sum = total_amount from payment where ID = @paymentID
set @amount = @sum/@cnt
while(@cnt > 0)
begin
	insert into installment (pid, date, status, amount)
	values (@paymentID, @date, 0, @amount)
	set @date = DATEADD(month, 6, @date)
	set @cnt -= 1
end

-- 3 k)
go
create proc AdminListAcceptPublication
As 
select P.title , Pt.serial_num from publication P inner join publicaton_of_thesis pt on p.title = pt.title
where p.is_accepted = 'True'

-- 3 l)
go
create proc AddCourse
@courseCode varchar(10), 
@creditHrs int, 
@fees decimal
as
insert into course (code, credit_hours, fees) 
values (@courseCode, @creditHrs, @fees)

go
create proc linkCourseStudent
@courseID int,
@studentID int
as
insert into take_course (sid, cid) 
values (@studentID, @courseID)

go
create proc addStudentCourseGrade
@courseID int, 
@studentID int, 
@grade decimal
as
update take_course
set grade = @grade
where sid = @studentID and cid = @courseID

-- 3 m)
go
create proc ViewExamSupDefense 
@defenseDate datetime
As
select e.name from examiner e
inner join evaluates eval on e.ID = eval.eid 
where @defenseDate = eval.date
select s.name from evaluates
inner join make_under_supervision mus on eval.serial_num = mus.serial_num 
inner join supervisor sv on sv.id = mus.vid where @defenseDate = eval.date 

-- 4 a)
go
create proc EvaluateProgressReport
@supervisorID int,
@thesisSerialNo int,
@progressReportNo int,
@evaluation int
as
if(@evaluation<=3 and @evaluation>=0)
	update progress_report
	set evaluation = @evaluation , vid = @supervisorID 
	where  serial_num = @thesisSerialNo and report_num = @progressReportNo;

-- 4 b)
go
create proc ViewSupStudentsYears
@supervisorID int
as
select s.first_name , s.last_name , t.years_spent from student s inner join make_under_supervision m on s.ID = m.sid
inner join thesis t on t.serial_num = m.serial_num
where m.vid = @supervisorID

-- 4 c)
go
create proc SubViewProfile
@supervisorID int
as
select * 
from supervisor
where supervisor.ID = @supervisorID

go
-- create proc UpdateSupProfile


-- 4 d)
create proc ViewAllStudentPublications
@StudentID int
as
select *
from publication
where sid = @StudentID

-- 4 e)
go
create proc AdddefenseGucian
@ThesisSerialNo int,
@DefenseDate DateTime,
@DefenseLocation varchar(15)
as 
insert into defense(date,serial_num,location) values(@DefenseDate,@ThesisSerialNo,@DefenseLocation)

go
create proc AddDefenseNonGucian
@ThesisSerialNo int,
@DefenseDate DateTime,
@DefenseLocation varchar(15)
as 
declare @min int
select @min = min(t.grade) 
from take_course t inner join make_under_supervision m on m.sid = t.sid
where m.serial_num = @ThesisSerialNo
if(@min > 50)
insert into defense(date,serial_num,location) values(@DefenseDate,@ThesisSerialNo,@DefenseLocation)

go
--f
--inserting an examiner in the examiner table and to his assigned thesis evaluation
create proc AddExaminer
@ThesisSerialNo int, @DefenseDate Datetime, @ExaminerName varchar(20)
, @National bit,@fieldOfWork varchar(20)
as
insert into examiner(name, field_of_work, is_national) Values(@ExaminerName, @fieldOfWork, @National);
insert into evaluates values(IDENT_CURRENT('examiner'),@defenseDate,@ThesisSerialNo,null);

go

--4g
--deleteing a thesis if the evaluation of its last progress report is zero
create proc CancelThesis
@ThesisSerialNo int
As
if(exists( select * from progress_report PR where PR.serial_num = @ThesisSerialNo and PR.date = max(PR.date) and PR.evaluation = 0))
delete from thesis
where thesis.serial_num = @ThesisSerialNo;

go
--4h
-- adding a grade to a thesis
create proc AddGrade
@ThesisSerialNo int, @grade decimal --improvised
As
update thesis 
set thesis.grade = @grade
where thesis.serial_num = @ThesisSerialNo;

-- The grade to be inserted is needed???


