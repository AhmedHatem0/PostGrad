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