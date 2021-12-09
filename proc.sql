--Abdo
create Proc StudentRegister 
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@Gucian bit,
@email varchar(50),
@address varchar(10)
as 
Insert Into Student (first_name,last_name,password,faculty,email,address) 
values (@first_name,@last_name,@password,@faculty,@email,@address)
Declare @ID int
select @ID = ID from student where email = @email
IF @gucian = 1 Insert Into GUCian(ID) values (@ID)
else Insert Into non_GUCian(ID) values (@ID)

--3 Admin 
 
go 
create proc AdminListSup
As 
select * from supervisor

go
create proc AdminViewAllTheses 
As
Select * from thesis

go
create proc AdminViewStudentThesisBySupervisor
As 
Select sv.first_name +sv.last_name as ' Supervisor name', t.title , std.first_name + std.last_name as 'Student name'
from supervisor sv inner join make_under_supervision mus on sv.ID = mus.vid 
inner join student std on std.ID = mus.sid 
inner join thesis t on t.serial_num = mus.serial_num 

go
create proc AdminUpdateExtension
@ThesisSerialNo int 
as 
update thesis 
set thesis.num_extensions += 1 where thesis.serial_num = @ThesisSerialNo
go
create proc AdminViewStudentProfile
@sid Int 
As
select * from student where student.ID = @sid

go
create proc AdminListAcceptPublication
As 
select P.title , Pt.serial_num from publication P inner join publicaton_of_thesis pt on p.title = pt.title
where p.is_accepted = 'True'

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
--Abdo
create proc AdminViewSupervisorProfile
@supId int
as 
select * from supervisor 
where id = @supId

go
create proc AdminViewOnGoingTheses
@thesesCount int output
as
select @thesesCount = count(*) from thesis
where current_timestamp >= start_date and 
(end_date is null or current_timestamp <= end_date)

go
create proc AdminListNonGucianCourse
@courseID int
as
select s.first_name+' '+s.last_name as name, c.code, t.grade 
from student s, take_course t, course c
where s.ID = t.sid and c.ID = t.cid and t.cid = @courseID 

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


-- 4 supervisor
--a
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


--b
go

create proc ViewSupStudentsYears
@supervisorID int
as
select s.first_name , s.last_name , t.years_spent from student s inner join make_under_supervision m on s.ID = m.sid
inner join thesis t on t.serial_num = m.serial_num
where m.vid = @supervisorID

go

--c
create proc SubViewProfile
@supervisorID int
as
select * 
from supervisor
where supervisor.ID = @supervisorID

go
-- create proc UpdateSupProfile


--d
create proc ViewAllStudentPublications
@StudentID int
as
select *
from publication
where sid = @StudentID

go

--e
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
declare @min
select @min = min(t.grade) 
from take_course t inner join make_under_supervision m on m.sid = t.sid
where m.serial_num = @ThesisSerialNo
if(@min > 50)
insert into defense(date,serial_num,location) values(@DefenseDate,@ThesisSerialNo,@DefenseLocation)
