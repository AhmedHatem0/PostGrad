use postgrad_office

exec StudentRegister 
'Adhm','Mohamed','3.14adhm','Engineering','1',
'Adhm.Mohamed@Stundent.guc.edu.eg','Egypt,Beni-Suef'

exec StudentRegister 
'Sara','Adel','soso2019','Applied Arts','0',
'Sara.Adel@gmail.com','Egypt,Cairo,Nasr city'

exec SupervisorRegister
'Slim','Abdennadher','silm@123456','Engineering',
'Slim.Abdennadher@gmail.com'

declare @suc bit
exec @suc = userLogin 1,'531828946'
print @suc

go
declare @suc bit
exec  @suc = userLogin 2,'kk50000'
print @suc

exec addMobile 3,'01005223366'

exec AdminListSup

exec AdminViewSupervisorProfile 12

exec AdminViewAllTheses

declare @count int
exec @count = AdminViewOnGoingTheses
print @count

exec AdminViewStudentThesisBySupervisor

exec AdminListNonGucianCourse 1 

exec AdminUpdateExtension 5

go
declare @suc bit
exec AdminIssueThesisPayment 15, 20000, 2, 20, @suc output
print @suc

go
declare @suc bit
exec AdminIssueThesisPayment 17, 20000, 2, 20, @suc output
print @suc

exec AdminViewStudentProfile 4

exec AdminIssueInstallPayment 5,'11/20/2021'

exec AdminListAcceptPublication

exec AddCourse 'ARTS505',6,10000

exec linkCourseStudent 6, 9

exec addStudentCourseGrade 10, 4, 99.5

exec ViewExamSupDefense '3/25/2023 15:00:00'

exec EvaluateProgressReport 13, 3, 3, 2

exec ViewSupStudentsYears 13

exec SupViewProfile 12

exec UpdateSupProfile 13, 'Haythm Othman', 'Engineering'

exec ViewAStudentPublications 10

exec AddDefenseGucian  11,'8/9/2024 14:00:00','H17'

exec AddDefenseNonGucian 15,'3/25/2020 11:00:00','H2'

exec AddExaminer 11, '8/9/2024 14:00:00', 'Mark Zuckerberg', '0', 'Engineering'

exec CancelThesis 15

exec AddGrade 5, 80

exec AddDefenseGrade 3,'3/25/2023 15:00:00',77

exec AddCommentsGrade 3,'3/25/2023 15:00:00','The candidate did display sufficient knowledge of the area and a capacity for clear thinking. He was also able to demonstrate a superior ability for analysis and design.',18

exec viewMyProfile 1

exec editMyProfile 1,'Methat','Mohamed','3.14159265358979','Methat@gmail.com','Egypt,Suez,Fasil,Al-Amal','MSC'

exec addUndergradID 1,'49-17771'

exec ViewCoursesGrades 8

exec ViewCoursePaymentsInstall 8

exec ViewThesisPaymentsInstall 1

exec ViewUpcomingInstallments 4

exec ViewMisedInstallments 1

exec AddProgressReport 1,'5/10/2015'

exec FillProgressReport 15, 1, 30, 'results and conclusion' 

exec ViewEvalProgressReport 1, 1

exec addPublication 'Integrated Psychotherapy approach to Education', '6/11/2021','Nature','Egypt','1'

exec linkPubThesis 1, 1