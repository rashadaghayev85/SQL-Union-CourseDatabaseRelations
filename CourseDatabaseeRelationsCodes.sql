create database CourseDatabasee
use CourseDatabasee
create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(50)
)

insert into Countries([Name])
values('Azerbaycan'),
      ('Turkiye'),
	  ('Iran')
create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[CountryId] int
foreign key (CountryId) references Countries(Id)
)
insert into Cities([Name],[CountryId])
values('Baki',1),
      ('Istanbul',2),
	  ('Tehran',3)
	 
select [name] from Cities where [CountryId]=2

create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Surname] nvarchar(50),
[Address] nvarchar(50),
[Email] nvarchar(50),
[Age] int,
[CityId]int
foreign key (CityId) references Cities(Id)
)
insert into Students([Name],[Surname],[Address],[Email],[Age],[CityId])
values('Rashad','Aghayev','Neftciler','resad@gmail.com',1,1),
      ('Icardi','Mauro','Taksim','mauro@gmail.com',1,2),
	  ('Mehdi','Rasuli','Alamdar','mehdi@gmail.com',1,3)

	 -- select [name] from Students where [CityId]=2
--	 select ct.Name as 'City',ctr.Name as 'Country' from Cities ct 
--full outer join Countries ctr
--on ct.CountryId=ctr.Id

create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Capacity] int,
[RoomId]int,
[EducationId]int
foreign key (RoomId) references Rooms(Id),
foreign key (EducationId) references Educations(Id),
)
insert into Groups([Name],[Capacity],[RoomId],[EducationId])
values('Pb101',18,1,1),
      ('D202',20,2,2),
	  ('M505',10,3,3)

 create table StudentsGroup(
 [Id]int primary key identity(1,1),
 [GroupId]int,
 [StudentId]int
 foreign key (GroupId) references Groups(Id),
 foreign key (StudentId) references Students(Id)
 )
 insert into StudentsGroup([GroupId],[StudentId])
values(2,1),
      (3,2),
	  (4,3)
 create table Educations(
[Id] int primary key identity(1,1),
[Name] nvarchar(50)
)
insert into Educations([Name])
values('Programming'),
      ('Design'),
	  ('Marketing')

create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Capacity]int
)
insert into Rooms([Name],[Capacity])
values('Sun',18),
      ('Moon',20),
	  ('Saturn',10)
create table GroupTeachers(
[Id] int primary key identity(1,1),
[GroupId] int,
[TeacherId]int
foreign key (GroupId) references Groups(Id),
 foreign key (TeacherId) references Teachers(Id)
)
insert into GroupTeachers([GroupId],[TeacherId])
values(2,1),
      (3,2),
	  (4,3)
create table Teachers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(50),
[Address] nvarchar(50),
[Email] nvarchar(50),
[Salary] int,
)
insert into Teachers([FullName],[Address],[Email],[Salary])
values('Cavid Bashirov','Ehmedli','cavid@gmail.com',3000),
      ('Ulvi Mecidov','Yasamal','ulvi@gmail.com',2000),
	  ('Ulvi','Aslanov','aslanov@gmail.com',13000)
create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[DepartmentId]int
foreign key (DepartmentId) references Departments(Id),
)
insert into Roles([Name],[DepartmentId])
values('Teachers',1),
      ('HelpDesk',2),
	  ('Director',3)

create table Departments(
[Id] int primary key identity(1,1),
[Name] nvarchar(50)
)
insert into Departments([Name])
values('Teachers'),
      ('HelpDesk'),
	  ('Director')
create table RoleStaffMembers(
[Id] int primary key identity(1,1),
[RoleId] int,
[DepartmentId]int
foreign key (DepartmentId) references Departments(Id),
foreign key (RoleId) references Roles(Id),
)
insert into RoleStaffMembers([RoleId],[DepartmentId])
values(2,1),
      (3,2),
	  (4,3)
create table StaffMembers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(50),
[Age]int,
[Salary] int,
[CityId]int
foreign key (CityId) references Cities(Id),
)
insert into StaffMembers([FullName],[Age],[Salary],[CityId])
values('Asif',33,1000,1),
      ('Deniz',23,800,2),
	  ('Majid Hoseini',19,1700,3)