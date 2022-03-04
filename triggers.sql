create trigger IssueInstallmentTrigger on installment
for Insert 
As
declare @count int
select @count = count(I1.pid) from inserted I inner join installment I1 on I.pid = I1.pid
if (@count > any (select p.num_installments from payment p, inserted I where p.ID = I.pid))
BEGIN
RAISERROR('This payment already have its installments', 16, 1)
ROLLBACK TRANSACTION
END
go

create proc AdminUpdateExtension
@ThesisSerialNo int, 
@success bit output
as 
if(Exists (select * from thesis t where t.serial_num = @ThesisSerialNo ))
BEGIN
update thesis 
set thesis.num_extensions += 1 where thesis.serial_num = @ThesisSerialNo
set @success = '1'
END
else 
set @success = '0'
