
-- 1 a) Register to the website by using my name (First and last name), password, faculty, email, and address.
create Proc StudentRegister 
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@Gucian bit,
@email varchar(50),
@address varchar(50)
as 
Insert Into PostGradUser(password,email) 
values (@password,@email)
IF @gucian = 1 
Insert Into GUCianStudent(ID, first_name, last_name, faculty, address) 
values (IDENT_CURRENT('PostGradUser'), @first_name, @last_name, @faculty, @address)
else 
Insert Into NonGUCianStudent(ID, first_name, last_name, faculty, address) 
values (IDENT_CURRENT('PostGradUser'), @first_name, @last_name, @faculty, @address)

go
create proc SupervisorRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@email varchar(50) 
as 
insert into PostGradUser(email,password) values(@email,@password)
insert into supervisor values(IDENT_CURRENT('PostGradUser'),@faculty,@first_name);

-- 2 a) login using my username and password.
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

-- 2 b) add my mobile number(s).
go
create proc addMobile
@ID int, @mobile_number varchar(20)
as
if(exists(select * from GucianStudent G where G.id = @ID)) 
insert into GUCStudentPhoneNumber Values(@ID,@mobile_number);
else
insert into NonGUCStudentPhoneNumber Values(@ID,@mobile_number);

-- 3 a) List all supervisors in the system.
go 
create proc AdminListSup
As 
select * from supervisor

-- 3 b) view the profile of any supervisor that contains all his/her information.
go
create proc AdminViewSupervisorProfile
@supId int
as 
select * from supervisor 
where id = @supId

-- 3 c) List all Theses in the system.
go
create proc AdminViewAllTheses 
As
Select * from thesis

-- 3 d) List the number of on going theses.
go
create proc AdminViewOnGoingTheses
@thesesCount int output
as
select @thesesCount = count(*) from thesis
where current_timestamp >= start_date and 
(end_date is null or current_timestamp <= end_date)

-- 3 e) List all supervisors’ names currently supervising students, theses title, student name
go
create proc AdminViewStudentThesisBySupervisor
As 
Select sv.name, t.title , std.first_name +' '+ std.last_name as 'Student name'
from supervisor sv inner join GUCianStudentRegisterThesis reg on sv.ID = reg.vid 
inner join GUCianStudent std on std.ID = reg.sid 
inner join thesis t on t.serial_num = reg.serial_num 
union
Select sv.name, t.title , std.first_name +' '+ std.last_name as 'Student name'
from supervisor sv inner join NonGUCianStudentRegisterThesis reg on sv.ID = reg.vid 
inner join NonGUCianStudent std on std.ID = reg.sid 
inner join thesis t on t.serial_num = reg.serial_num

-- 3 f) List nonGucians names, course code, and respective grade.
go
create proc AdminListNonGucianCourse
@courseID int
as
select s.first_name+' '+s.last_name as name, c.code, t.grade 
from NonGUCianStudent s, NonGucianStudentTakeCourse t, course c
where s.ID = t.sid and c.ID = t.cid and t.cid = @courseID

-- 3 g) Update the number of thesis extension by 1.
go
create proc AdminUpdateExtension
@ThesisSerialNo int 
as 
update thesis 
set thesis.num_extensions += 1 where thesis.serial_num = @ThesisSerialNo

-- 3 h) Issue a thesis payment.
go
CREATE proc AdminIssueThesisPayment 
@ThesisSerialNo int,
@amount decimal,
@noOfInstallments int,
@fundPercentage decimal,
@success bit output
AS
if (exists(select * from thesis t where t.serial_num = @ThesisSerialNo))
	begin
		set @success = '1';
		insert into payment(num_installments, total_amount, fund_precentage) 
		values(@noOfInstallments, @amount, @fundPercentage)
		update thesis 
		set payment_ID = IDENT_CURRENT('payment')
		where thesis.serial_num = @ThesisSerialNo
	end
else 
	set @success = '0';


-- 3 i) view the profile of any student that contains all his/her information.
go
create proc AdminViewStudentProfile
@sid Int 
As
select * from student where student.ID = @sid

-- 3 j) Issue installments as per the number of installments for a certain payment every six months starting from the entered date.
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

-- 3 k) List the title(s) of accepted publication(s) per thesis.
go
create proc AdminListAcceptPublication
As 
select P.title , Pt.serial_num from publication P inner join ThesisHasPublication pt on p.pubid = pt.pubid
where p.is_accepted = 'True'

-- 3 l) Add courses and link courses to students.
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
insert into nonNonGucianStudentTakeCourse(sid, cid) 
values (@studentID, @courseID)

go
create proc addStudentCourseGrade
@courseID int, 
@studentID int, 
@grade decimal
as
update NonGucianStudentTakeCourse
set grade = @grade
where sid = @studentID and cid = @courseID

-- 3 m) View examiners and supervisor(s) names attending a thesis defense taking place on a certain date.
go
create proc ViewExamSupDefense 
@defenseDate datetime
As
select e.name from examiner e
inner join ExaminerEvaluateDefense eval on e.ID = eval.eid 
where @defenseDate = eval.date
union
select sv.name from defense d
inner join GUCianStudentRegisterThesis reg on d.serial_num = reg.serial_num 
inner join supervisor sv on sv.id = reg.vid where @defenseDate = d.date 
union
select sv.name from defense d
inner join NonGUCianStudentRegisterThesis reg on d.serial_num = reg.serial_num 
inner join supervisor sv on sv.id = reg.vid where @defenseDate = d.date 

-- 4 a) Evaluate a student’s progress report, and give evaluation value 0 to 3.
go
create proc EvaluateProgressReport
@supervisorID int,
@thesisSerialNo int,
@progressReportNo int,
@evaluation int
as
if(@evaluation<=3 and @evaluation>=0)
begin
	update GucianProgressReport
	set evaluation = @evaluation
	where serial_num = @thesisSerialNo and report_num = @progressReportNo and vid = @supervisorID 
	update NonGucianProgressReport
	set evaluation = @evaluation
	where serial_num = @thesisSerialNo and report_num = @progressReportNo and vid = @supervisorID 
end
-- 4 b) View all my students’s names and years spent in the thesis.
go
create proc ViewSupStudentsYears
@supervisorID int
as
select s.first_name , s.last_name , t.years_spent 
from GUCianStudent s inner join GUCianStudentRegisterThesis r on s.ID = r.sid
inner join thesis t on t.serial_num = r.serial_num
where r.vid = @supervisorID
union
select s.first_name , s.last_name , t.years_spent 
from NonGUCianStudent s inner join NonGUCianStudentRegisterThesis r on s.ID = r.sid
inner join thesis t on t.serial_num = r.serial_num
where r.vid = @supervisorID

-- 4 c) View my profile and update my personal information.
go
create proc SubViewProfile
@supervisorID int
as
select * 
from supervisor
where supervisor.ID = @supervisorID

go
create proc UpdateSupProfile
@supervisorID int,
@name varchar(20),
@faculty varchar(20)
as
update supervisor
set name = @name, faculty = @faculty
where ID = @supervisorID

-- 4 d) View all publications of a student.
go
create proc ViewAllStudentPublications
@StudentID int
as
select *
from publication p inner join ThesisHasPublication tp on tp.pubid = p.pubid
inner join GUCianStudentRegisterThesis reg on reg.serial_num = tp.serial_num
where reg.sid = @StudentID
union
select *
from publication p inner join ThesisHasPublication tp on tp.pubid = p.pubid
inner join NonGUCianStudentRegisterThesis reg on reg.serial_num = tp.serial_num
where reg.sid = @StudentID

-- 4 e) Add defense for a thesis, for nonGucian students all courses’ grades should be greater than 50 percent.
go
create proc AddDefenseGucian
@ThesisSerialNo int,
@DefenseDate DateTime,
@DefenseLocation varchar(15)
as 
insert into defense(date, serial_num, location) 
values(@DefenseDate, @ThesisSerialNo, @DefenseLocation)

go
create proc AddDefenseNonGucian
@ThesisSerialNo int,
@DefenseDate DateTime,
@DefenseLocation varchar(15)
as 
declare @min int
select @min = min(t.grade) 
from NonGucianStudentTakeCourse t inner join NonGUCianStudentRegisterThesis m on m.sid = t.sid
where m.serial_num = @ThesisSerialNo
if(@min > 50)
insert into defense(date,serial_num,location) values(@DefenseDate,@ThesisSerialNo,@DefenseLocation)

go
-- 4 f) inserting an examiner in the examiner table and to his assigned thesis evaluation
create proc AddExaminer
@ThesisSerialNo int,
@DefenseDate Datetime,
@ExaminerName varchar(20),
@National bit,
@fieldOfWork varchar(20)
as
insert into examiner(name, field_of_work, is_national) Values(@ExaminerName, @fieldOfWork, @National);
insert into ExaminerEvaluateDefense values(IDENT_CURRENT('examiner'),@defenseDate,@ThesisSerialNo,null);

-- 4 g) deleteing a thesis if the evaluation of its last progress report is zero
go
create proc CancelThesis
@ThesisSerialNo int
As
if(exists(select * from GucianProgressReport PR 
where PR.serial_num = @ThesisSerialNo and PR.evaluation = 0 and
PR.date >= all (select date from GucianProgressReport pr2 where pr2.serial_num = @ThesisSerialNo)))
delete from thesis
where thesis.serial_num = @ThesisSerialNo
if(exists(select * from NonGucianProgressReport PR 
where PR.serial_num = @ThesisSerialNo and PR.evaluation = 0 and
PR.date >= all (select date from NonGucianProgressReport pr2 where pr2.serial_num = @ThesisSerialNo)))
delete from thesis
where thesis.serial_num = @ThesisSerialNo

go
--4 h) adding a grade to a thesis
create proc AddGrade
@ThesisSerialNo int,
@grade decimal --improvised
As
update thesis 
set thesis.grade = @grade
where thesis.serial_num = @ThesisSerialNo;

-- The grade to be inserted is needed???


--5 examiner
--a
--adding a grade for a defense given the date of the defense and its thesis's serial number
go
create proc AddDefenseGrade
@ThesisSerialNo int, @DefenseDate Datetime, @grade decimal
as
update defense
set defense.grade = @grade
where defense.serial_num = @ThesisSerialNo and defense.date = @DefenseDate

go

--b
--adding comments on a specific defense by an examiner
create proc AddCommentsGrade
@ThesisSerialNo int, @DefenseDate Datetime, @comments varchar(300), @examinerID int
as
update ExaminerEvaluateDefense
set Comment = @comments
where serial_num = @ThesisSerialNo and date = @DefenseDate and eid = @examinerID

go

--6
--a 
go
create proc viewMyProfile 
@studentId int
As 
if(exists(select * from GucianStudent G where G.id = @studentId)) 
select * from GUCianStudent where id = @studentId
else
select * from NonGUCianStudent where id = @studentId

--b
go
create proc editMyProfile
@studentID int,
@firstName varchar(10),
@lastName varchar(10),
@password varchar(10),
@email varchar(10),
@address varchar(10),
@type varchar(10)
As
if(exists(select * from GucianStudent G where G.id = @studentId)) 
update GUCianStudent 
set first_name = @firstName, last_name = @lastName,address = @address,type = @type where ID = @studentID
update PostGradUser
set email = @email, postGradUser.password = @password
--c
go 
create proc addUndergradID
@studentID int, @undergradID varchar(10)
as
update GUCianStudent
set UndergradID = @undergradID
where ID = @studentID
--d 
go
create proc ViewCoursesGrades
@studentID int
As
select grade from NonGucianStudentTakeCourse where sid= @studentID
go

--e.1
create proc ViewCoursePaymentsInstall
@studentID int
as
select P.* , I.*
from NonGucianStudentPayForCourse NG inner join payment P on NG.payment_num = P.ID
	inner join installment I on NG.payment_num = I.pid
where NG.sid = @studentID

go
--e.2
create proc ViewThesisPaymentsInstall
@studentID int
as
select P.* , I.*
from ( (select NG.sid, NG.serial_num from NonGUCianStudentRegisterThesis NG) union
(select G.sid, G.serial_num from GUCianStudentRegisterThesis G)) S inner join thesis T on T.serial_num = S.serial_num
inner join payment P on P.ID = T.payment_ID inner join installment I on I.pid = P.ID
where S.sid = @studentID

go
--e.3
create proc ViewUpcomingInstallments
@studentID int
as
select I.*
from ( (select NG.sid, NG.serial_num from NonGUCianStudentRegisterThesis NG) union
(select G.sid, G.serial_num from GUCianStudentRegisterThesis G)) S inner join thesis T on T.serial_num = S.serial_num
inner join installment I on I.pid = T.payment_ID
where I.date> CURRENT_TIMESTAMP

go
--e.4
create proc ViewMisedInstallments
@studentID int
as
select I.*
from ( (select NG.sid, NG.serial_num from NonGUCianStudentRegisterThesis NG) union
(select G.sid, G.serial_num from GUCianStudentRegisterThesis G)) S inner join thesis T on T.serial_num = S.serial_num
inner join installment I on I.pid = T.payment_ID
where I.date< CURRENT_TIMESTAMP and I.status = '0'

go
--f.1
create proc AddProgressReport
@thesisSerialNo int,
@progressReportDate date
as
declare @studentID int
if(exists(select sid from GUCianStudentRegisterThesis where serial_num = @thesisSerialNo))
begin
select @studentID = sid from GUCianStudentRegisterThesis where serial_num = @thesisSerialNo
insert into GucianProgressReport(sid,date,serial_num) values(@studentID,@progressReportDate, @thesisSerialNo);
end
else
begin
select  @studentID = sid from NonGUCianStudentRegisterThesis where serial_num = @thesisSerialNo
insert into NonGucianProgressReport(sid,date,serial_num) values(@studentID,@progressReportDate,@thesisSerialNo);
end

--f.2
go
create proc FillProgressReport 
@thesisSerialNo int,
@progressReportNo int, 
@state int,
@description varchar(200)
As
declare @studentID int
declare @supID int
if(exists(select sid from GUCianStudentRegisterThesis where serial_num = @thesisSerialNo))
begin
select @studentID = sid, @supID = vid from GUCianStudentRegisterThesis where serial_num = @thesisSerialNo
update GuianProgressReport 
set progress_state = @state, vid = @supID,description = @description where report_num = @progressReportNo and SID = @studentID
end
else
begin
select  @studentID = sid, @supID = vid from NonGUCianStudentRegisterThesis where serial_num = @thesisSerialNo
update NonGuianProgressReport 
set progress_state = @state, vid = @supID,description = @description where report_num = @progressReportNo and SID = @studentID
end

--g 
go 
CREATE proc ViewEvalProgressReport
@thesisSerialNo int, @progressReportNo int
AS
SELECT evaluation FROM GucianProgressReport G where G.serial_num=@thesisSerialNo AND report_num=@progressReportNo
UNION 
SELECT evaluation FROM NonGucianProgressReport G where G.serial_num=@thesisSerialNo AND report_num=@progressReportNo
--h

go
CREATE proc addPublication
 @title varchar(50),
 @pubDate datetime,
 @host varchar(50), 
 @place varchar(50),
 @accepted bit
 AS
 insert into publication(
title ,host ,place ,pub_date,is_accepted) 
values(@title,@host,@place,@pubdate,@accepted)

--i

go
CREATE proc linkPubThesis
@pubId int, @thesisSerialNo int 
As
insert into ThesisHasPublication VALUES(@thesisSerialNo,@PubID)
