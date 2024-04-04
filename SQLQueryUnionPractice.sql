create table Users(
[Id] int primary key identity(1,1),
[Name]nvarchar(50),
[Surname]nvarchar(50)
)
create table Teachers(
[Id] int primary key identity(1,1),
[Name]nvarchar(50),
[Surname]nvarchar(50),
[Age] int
)
create table Doctors(
[Id] int primary key identity(1,1),
[Name]nvarchar(50),
[Surname]nvarchar(50)
)
insert into Users([Name],[Surname])
values('Ilqar','Shiryev'),
	  ('Behruz','Eliyev'),
	  ('Kamran','Muradov'),
	  ('Test1','Testov1')

insert into Doctors([Name],[Surname])
values('Ilqar','Shiryev'),
	  ('Behruz','Eliyev'),
	  ('Kamran','Muradov'),
	  ('Test2','Testov2'),
	  ('Test3','Testov3')

insert into Teachers([Name],[Surname],[Age])
values('Ilqar','Shiryev',26),
	  ('Behruz','Eliyev',35),
	  ('Kamran','Muradov',34),
	  ('Test1','Testov1',16)



select * from Users
union
select * from Doctors


select * from Users
union all
select * from Doctors

select[Name] as'Data' from Users
union
select [Surname] from Students -- tipe gore union edir
union
select [Name] from Doctors

select [Name] from Users
intersect
select [Name] from Doctors

select [Name] from Users
except
select [Name] from Doctors

select * from Students


select Count(*) as 'Student count',Age
from Students
group by Age;

declare @num1 int =50;
declare @num2 int =30;

if @num1>@num2
print 'Yes'
else
print'no'

select * from Students
select * from Teachers

create function dbo.getStudentsAvgAge()
returns int
as
begin
return(select AVG(age) from Students)
end
create function dbo.getTeachersAvgAge()
returns int
as
begin
return(select AVG(age) from Teachers)
end

create procedure usp_chechStudentsAndTeachersAvgAges
@studentsAvgAge int,
@teacherAvgAge int
as
begin

if @studentsAvgAge>@teacherAvgAge
print'Student average age is bigger than teachers average ages'
else
print'Student average age is not bigger than teachers average ages'
end

create procedure usp_chechStudentsAndTeachersAvgAges2
as
begin
declare @stuAvgAge int= (select dbo.getStudentsAvgAge())
declare @teachAvgAge int=(select dbo.getTeachersAvgAge())
if @stuAvgAge>@teachAvgAge
print'Student average age is bigger than teachers average ages'
else
print'Student average age is not bigger than teachers average ages'
end

exec usp_chechStudentsAndTeachersAvgAges2


declare @counter int
set @counter=1
while(@counter<=10)
begin
print'The counter value is='+convert(varchar,@counter)
set @counter=@counter+1
end

begin try
select
1/0 as error;
end try
begin catch
select
ERROR_MESSAGE()as ErrorMessage;
end catch