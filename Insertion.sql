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


