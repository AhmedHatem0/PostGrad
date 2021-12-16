declare @ID int

insert into PostGradUser values('abdel-rahman.mahmoud@studnet.guc.edu.eg','531828946') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into GUCianStudent values (@ID,'Abdelrahman','Hussein','Engineering','MSC',1.08,'Egypt,Suez,Fasil,Al-Amal','49-17771')
insert into GUCStudentPhoneNumber values (@ID,'01001553355')

insert into PostGradUser values('Ahmed.Semeda@studnet.guc.edu.eg','15156295235') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into GUCianStudent values (@ID,'Ahmed','Hatem','Engineering','MSC',0.81,'Egypt,Fayoum,Fayoum City','49-19696')

insert into PostGradUser values('Kareem.Eid@studnet.guc.edu.eg','zjdfiosd$$@284') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into GUCianStudent values (@ID,'Kareem','Eid','Engineering','PHD',0.77,'Egypt,Damietta,New Damietta','49-19194')

insert into PostGradUser values('Asem.Sameih@studnet.guc.edu.eg','454716154184') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into GUCianStudent values (@ID,'Asem','Sameih','Pharmacy','PHD',1.2,'Egypt,Kafr El-Sheikh','49-1485')

insert into PostGradUser values('Youmna.Ayman@studnet.guc.edu.eg','159753yyyy') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into GUCianStudent values (@ID,'Youmna','Ayman','Law','MSC',2.3,'Egypt,Cairo,Rehab city','37-1234')

insert into PostGradUser values('Youssef.Mahmoud@studnet.guc.edu.eg','24682468$$') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into GUCianStudent values (@ID,'Youssef','Mahmoud','Applied Arts','PHD',0.98,'Egypt,Cairo,Maadi','43-11228')

insert into PostGradUser values('Aya.Ibrahim@studnet.guc.edu.eg','ay<3<3ay') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into GUCianStudent values (@ID,'Aya','Ibrahim','Applied Arts','MSC',1.3,'Egypt,Alexandria','40-15204')
-----------------------------------------------------
insert into PostGradUser values('Amr.Omran@gmail.com','aoaooa2205') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into NonGUCianStudent values (@ID,'Amr','Omran','Engineering','MSC',3.0,'Egypt,Cairo,Zamalek')
insert into NonGUCStudentPhoneNumber values (@ID,'01001259999')

insert into PostGradUser values('Yara.Ahmed@gmail.com','abcd12345') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into NonGUCianStudent values (@ID,'Yara','Ahmed','Applied Arts','PHD',3.78,'Egypt,Alexandria')

insert into PostGradUser values('Ahmed.Ali@gmail.com','nmnmss555') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into NonGUCianStudent values (@ID,'Ahmed','Ali','Business','MSC',3.3,'Egypt,Giza,Haram')
-----------------------------------------------------
insert into Course values(8, 'CSEN1002',10000)
insert into Course values(6, 'PHARM1201',12000)
insert into Course values(4, 'ENG502',5000)
insert into Course values(3, 'BUSS604',9000)
insert into Course values(2, 'CSEN903',4000)
-----------------------------------------------------
insert into NonGucianStudentTakeCourse values(8,1,80.5)
insert into NonGucianStudentTakeCourse values(8,5,92.3)
insert into NonGucianStudentTakeCourse values(10,4,null)
-----------------------------------------------------
insert into PostGradUser values('Mona.Farouk@guc.edu.eg','kzjfokjsovm54694') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into admin values(@ID)
-----------------------------------------------------
insert into PostGradUser values('Mervat.Abuelkheir@guc.edu.eg','sdpsdosd') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into supervisor values(@ID, 'Engineering', 'Mervat Abuelkheir')

insert into PostGradUser values('Haytham.Ismail@guc.edu.eg','sdppokdpotksdfo1') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into supervisor values(@ID, 'Engineering', 'Haytham Ismail')

insert into PostGradUser values('Amr.El-Mougy@guc.edu.eg','pdofpsdkfvl') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into supervisor values(@ID, 'Engineering', 'Amr EL-mougy')

insert into PostGradUser values('Yasmin.Mohammed@guc.edu.eg','loskdfpo15065') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into supervisor values(@ID, 'Pharmacy', 'Yasmin Mohammed')

insert into PostGradUser values('Osama.Hany@guc.edu.eg','222jjjjjjjsss') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into supervisor values(@ID, 'Law', 'Osama Hany')

insert into PostGradUser values('Mohamed.Ismail@guc.edu.eg','mxmmxmmmxAA22') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into supervisor values(@ID, 'Applied Arts', 'Mohamed Ismail')
-----------------------------------------------------
insert into PostGradUser values('Mark.Zuckerberg@gmail.com','MMMMM11111') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into examiner values(@ID, 'Mark Zuckerberg', 'Engineering', '0')

insert into PostGradUser values('Ahmed.Taher@gmail.com','asdqwerty55') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into examiner values(@ID, 'Ahmed Taher', 'Engineering', '1')

insert into PostGradUser values('Rola.Amer@gmail.com','cutecats88') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into examiner values(@ID, 'Rola Amer', 'Medicine', '1')

insert into PostGradUser values('Mina.Michael@gmail.com','55asasa55') 
set @ID = IDENT_CURRENT('PostGradUser')
insert into examiner values(@ID, 'Mina Michael', 'Bussiness', '1')
-----------------------------------------------------
insert into payment values(2, 20000, 51.5)
insert into payment values(1, 8000, 70)
insert into payment values(3, 40000, 12.5)
insert into payment values(4, 80000, 10)
insert into payment values(2, 30000, 20)
-----------------------------------------------------
insert into payment values(2, 10000, 20)
insert into payment values(2, 9000, 20)
insert into payment values(1, 4000, 20)
-----------------------------------------------------
insert into NonGucianStudentPayForCourse values(6,8,1)
insert into NonGucianStudentPayForCourse values(8,8,4)
insert into NonGucianStudentPayForCourse values(7,10,3)
-----------------------------------------------------
insert into thesis (field, type, title, start_date, end_date, num_extensions, payment_ID) 
values 
('Computer Science', 'MSC', 'User interface modernization', '3/20/2015', '11/20/2015', 0, 1),
('Computer Science', 'MSC', 'Development of an automated workplace', '5/30/2019', '1/2/2020', 1, 2),
('Computer Science', 'MSC', 'Online store development and creation', '7/25/2021', '4/25/2023', 1, 3),
('Medicine', 'PHD', 'The influence of IT in the field of biomedicine', '8/20/2021', '4/25/2024', 0, 4),
('Art', 'MSC', 'Gustav Klimt’s Painting Techniques', '10/20/2021', '6/25/2022', 0, 5),
('Art', 'MSC', 'Jazz Music of the 21st century', '10/20/2017', '10/25/2018', 0, null),
('Art', 'PHD', 'Censorship of Art in Nazi Germany', '10/20/2020', '6/25/2024', 0, null),
('Business', 'PHD', 'How can creative marketing increase your sales?', '10/10/2019', '6/10/2023', 1, null),
('Law', 'PHD', 'Analysis of Welfare Politics in Japan', '9/9/2020', '6/10/2025', 2, null),
('Business', 'MSC', 'Important aspects of workforce regulations', '1/24/2019', '4/25/2020', 1, null),
('Engineering', 'PHD', 'Self-driving automobiles', '5/20/2019', '9/9/2024', 3, null),
('Computer Science', 'MSC', 'What is the future of the Internet?', '8/20/2019', '9/9/2020', 0, null),
('Medicine', 'MSC', 'Health problems caused by service time', '8/8/2017', '10/10/2018', 1, null),
('Art', 'PHD', 'Ancient Greek Sculpture and Its Peculiarities', '11/11/2020', '11/11/2024', 1, null),
('Business', 'MSC', 'How to motivate employees?', '6/6/2019', '5/5/2020', 0, null)
-----------------------------------------------------
insert into installment values(1,'4/20/2015','1',10000)
insert into installment values(1,'10/20/2015','1',10000)
insert into installment values(2,'7/30/2019','1',8000)
insert into installment values(3,'7/25/2021','1',10000)
insert into installment values(3,'2/25/2022','0',15000)
insert into installment values(3,'10/25/2022','0',15000)
insert into installment values(4,'8/20/2021','1',20000)
insert into installment values(4,'4/20/2022','1',20000)
insert into installment values(4,'11/20/2022','0',20000)
insert into installment values(4,'8/20/2023','0',20000)
-----------------------------------------------------
insert into defense values('11/10/2015 13:00:00',1,90.5,'H15')
insert into defense values('1/1/2020 14:30:00',2,70,'C2.201')
insert into defense values('3/25/2023 15:00:00',3,null,'H5')
insert into defense values('4/25/2024 14:00:00',4,null,'H17')
insert into defense values('6/25/2022 11:00:00',5,null,'H15')
insert into defense values('3/5/2020 11:00:00',15,80,'H12')
-----------------------------------------------------
insert into ExaminerEvaluateDefense values(18,'11/10/2015 13:00:00',1,'The contents were definitely sufficiently substantial and broad-ranging to allow coverage of the field. The only difficulty was that the field was so large that the candidates achievements tended to be isolated.')
insert into ExaminerEvaluateDefense values(19,'1/1/2020 14:30:00',2,'this is a well-written thesis which presents interesting ideas across a quite broad range. I believe that there are several areas in which the discussion should be tightened and strengthened to make a convincing PhD thesis.')
insert into ExaminerEvaluateDefense values(18,'3/25/2023 15:00:00',3,null)
insert into ExaminerEvaluateDefense values(19,'3/25/2023 15:00:00',3,null)
insert into ExaminerEvaluateDefense values(18,'4/25/2024 14:00:00',4,null)
insert into ExaminerEvaluateDefense values(20,'4/25/2024 14:00:00',4,null)
insert into ExaminerEvaluateDefense values(21,'3/5/2020 11:00:00',15,'The main weakness lies in the lack of resolution both to each chapter and to the thesis as a whole. Chapters end somewhat abruptly with no attempt to summarize and reflect upon what has been covered or point forward to subsequent chapters. Concluding summary discussions would be beneficial.')
-----------------------------------------------------