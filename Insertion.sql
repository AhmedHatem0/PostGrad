Create proc AddNewExaminer
@name varcHAR(20),
@fieldOfWork VARCHAR(20) ,
@isNational bit,
@email varchar(50),
@password varchar(20)
As
insert into PostGradUser Values (@email, @password)
insert into Examiner Values (IDENT_CURRENT('PostGradUser'),@name, @fieldOfWork,@isNational)

go

create proc AddAdmin @emil varchar(50) ,@password varchar(20)
as 
insert into PostGradUser Values (@email, @password)
insert into Admin Values (IDENT_CURRENT('PostGradUser'))

go 
create proc AddGPA  @ID int , @GPA decimal
As 
if Exists(select * from GUCianStudent where @ID  =ID)
begin
update GUCianStudent 
set GPA = @Gpa where @ID = ID 
end
Else
if Exists(select * from NonGUCianStudent where @ID  =ID)
begin
update NonGUCianStudent 
set GPA = @Gpa where @ID = ID 
end

go
create proc AddType @ID int , @type varchar(10)
As 
if Exists(select * from GUCianStudent where @ID  =ID)
begin
update GUCianStudent 
set type = @type where @ID = ID 
end
Else
if Exists(select * from NonGUCianStudent where @ID  =ID)
begin
update NonGUCianStudent 
set type = @type where @ID = ID 
end

insert into thesis (field, type, title, start_date, end_date) 
values 
('Computer Science', 'MSC', 'User interface modernization', '3/20/2015', '11/20/2015'),
('Computer Science', 'MSC', 'Development of an automated workplace', '5/30/2019', '1/2/2020'),
('Computer Science', 'MSC', 'Online store development and creation', '7/25/2021', '2/25/2022'),
('Medicine', 'PHD', 'The influence of IT in the field of biomedicine', '8/20/2021', '4/25/2024'),
('Art', 'MSC', 'Gustav Klimt’s Painting Techniques', '10/20/2021', '6/25/2022'),
('Art', 'MSC', 'Jazz Music of the 21st century', '10/20/2017', '10/25/2018'),
('Art', 'PHD', 'Censorship of Art in Nazi Germany', '10/20/2020', '6/25/2024'),
('Business', 'PHD', 'How can creative marketing increase your sales?', '10/10/2019', '6/10/2023'),
('Law', 'PHD', 'Analysis of Welfare Politics in Japan', '9/9/2020', '6/10/2025'),
('Business', 'MSC', 'Important aspects of workforce regulations', '1/24/2019', '4/25/2020'),
('Engineering', 'PHD', 'Self-driving automobiles', '5/20/2019', '9/9/2024'),
('Computer Science', 'MSC', 'What is the future of the Internet?', '8/20/2019', '9/9/2020'),
('Medicine', 'MSC', 'Health problems caused by service time', '8/8/2017', '10/10/2018'),
('Art', 'PHD', 'Ancient Greek Sculpture and Its Peculiarities', '11/11/2020', '11/11/2024'),
('Business', 'MSC', 'How to motivate employees?', '6/6/2019', '5/5/2020')
