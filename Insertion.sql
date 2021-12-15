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

create proc AddAdmin @email varchar(50) ,@password varchar(20)
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

exec AdminIssueThesisPayment 1, 20000, 2, 51.5
exec AdminIssueThesisPayment 2, 8000, 1, 70
exec AdminIssueThesisPayment 3, 40000, 3, 10
exec AdminIssueThesisPayment 4, 80000, 5, 10
exec AdminIssueThesisPayment 5, 30000, 2, 20
exec AdminIssueInstallPayment 1, '4/20/2015'
exec AdminIssueInstallPayment 2, '7/30/2019'
exec AdminIssueInstallPayment 3, '8/25/2021'
exec AdminIssueInstallPayment 4, '9/20/2021'
exec AdminIssueInstallPayment 5, '11/25/2021'

Exec StudentRegister 'Abdelrahman',
'Hussein',
'531828946',
'Engineering',
'1',
'abdel-rahman.mahmoud@studnet.guc.edu.eg',
'Egypt,Suez,Fasil,Al-Amal'
declare @ID int
set @ID = IDENT_CURRENT('PostGradUser')
exec AddGPA @ID , 1.08
exec AddType @ID ,'MSC'

Exec StudentRegister 'Ahmed',
'Hatem',
'15156295235',
'Engineering',
'1',
'Ahmed.Semeda@studnet.guc.edu.eg',
'Egypt,Fayoum,Fayoum City'
declare @ID int
set @ID = IDENT_CURRENT('PostGradUser')
exec AddGPA @ID , 0.81
exec AddType @ID ,'MSC'

Exec StudentRegister 'Kareem',
'Eid',
'zjdfiosd$$@284',
'Engineering',
'1',
'Kareem.Eid@studnet.guc.edu.eg',
'Egypt,Damietta,New Damietta'
declare @ID int
set @ID = IDENT_CURRENT('PostGradUser')
exec AddGPA @ID , 0.77
exec AddType @ID ,'PHD'

Exec StudentRegister 'Asem',
'Sameih',
'454716154184',
'Pharmacy',
'1',
'Asem.Sameih@studnet.guc.edu.eg',
'Egypt,Kafr El-Sheikh,El-Zohour district'
declare @ID int
set @ID = IDENT_CURRENT('PostGradUser')
exec AddGPA @ID , 1.20
exec AddType @ID ,'PHD'
delete PostGradUser

exec AddAdmin 'Mona.Farouk@guc.edu.eg', 'kzjfokjsovm54694'

exec SupervisorRegister 'Mervat',
'Abuelkheir',
'sdpsdosdmksdf6265151',
'MET',
'Mervat.Abuelkheir@guc.edu.eg'


exec SupervisorRegister 'Haytham',
'Ismail',
'sdppokdpotksdfo1',
'MET',
'Haytham.Ismail@guc.edu.eg'

exec SupervisorRegister 'Amr',
'EL-mougy',
'pdofpsdkfvlxm6626posgsdv',
'MET',
'Amr.El-Mougy@guc.edu.eg'

exec SupervisorRegister 'Yasmin',
'Mohammed',
'loskdfpo15065',
'Pharmacy',
'Yasmin.Mohammed@guc.edu.eg'
insert into thesis (field, type, title, start_date, end_date, num_extension) 
values 
('Computer Science', 'MSC', 'User interface modernization', '3/20/2015', '11/20/2015', 0),
('Computer Science', 'MSC', 'Development of an automated workplace', '5/30/2019', '1/2/2020', 1),
('Computer Science', 'MSC', 'Online store development and creation', '7/25/2021', '4/25/2023', 1),
('Medicine', 'PHD', 'The influence of IT in the field of biomedicine', '8/20/2021', '4/25/2024', 0),
('Art', 'MSC', 'Gustav Klimt’s Painting Techniques', '10/20/2021', '6/25/2022', 0),
('Art', 'MSC', 'Jazz Music of the 21st century', '10/20/2017', '10/25/2018', 0),
('Art', 'PHD', 'Censorship of Art in Nazi Germany', '10/20/2020', '6/25/2024', 0),
('Business', 'PHD', 'How can creative marketing increase your sales?', '10/10/2019', '6/10/2023', 1),
('Law', 'PHD', 'Analysis of Welfare Politics in Japan', '9/9/2020', '6/10/2025', 2),
('Business', 'MSC', 'Important aspects of workforce regulations', '1/24/2019', '4/25/2020', 1),
('Engineering', 'PHD', 'Self-driving automobiles', '5/20/2019', '9/9/2024', 3),
('Computer Science', 'MSC', 'What is the future of the Internet?', '8/20/2019', '9/9/2020', 0),
('Medicine', 'MSC', 'Health problems caused by service time', '8/8/2017', '10/10/2018', 1),
('Art', 'PHD', 'Ancient Greek Sculpture and Its Peculiarities', '11/11/2020', '11/11/2024', 1),
('Business', 'MSC', 'How to motivate employees?', '6/6/2019', '5/5/2020', 0)

exec SupervisorRegister 'Osama',
'Hany',
'sdppokdpotksdfo1',
'Law',
'Osama.Hany@guc.edu.eg'
exec AdminIssueThesisPayment 1, 20000, 2, 51.5
exec AdminIssueThesisPayment 2, 8000, 1, 70
exec AdminIssueThesisPayment 3, 40000, 3, 10
exec AdminIssueThesisPayment 4, 80000, 5, 10
exec AdminIssueThesisPayment 5, 30000, 2, 20
exec AdminIssueInstallPayment 1, '4/20/2015'
exec AdminIssueInstallPayment 2, '7/30/2019'
exec AdminIssueInstallPayment 3, '8/25/2021'
exec AdminIssueInstallPayment 4, '9/20/2021'
exec AdminIssueInstallPayment 5, '11/25/2021'
