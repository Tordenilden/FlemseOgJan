--drop database ElevDB
--go
--create database ElevDB
--go
--use ElevDb


--select name, database_id 
--from sys.Databases
--where database_id < 5

--select * from INFORMATION_SCHEMA.TABLES
--select * from ElevDB.INFORMATION_SCHEMA.TABLES
--select * from sys.tables
--drop database ElevDB

if not exists(select * from sys.Databases where name = 'ElevDB')
begin
   create database ElevDB
   print 'ElevDB created'
end
else
begin
   print 'ElevDB allready exists'
end

go

use ElevDB

--drop table if exists Elev

if exists(select * from ElevDB.INFORMATION_SCHEMA.TABLES where table_name = 'Elev')
begin
   drop table Elev
end 
go

drop table if exists Fag_L�rer
go
drop table if exists Fag
go
drop table if exists L�rer
go


create table Fag
(
   Id int primary key identity(1000, 1),
   Navn nvarchar(30)
)

create table dbo.Elev
(
   Id int Primary Key identity,
   Navn Nvarchar(35) not null check(Navn not like '%[^A-� a-�]%'),
   Kendetegn Nvarchar(30),
   Alder int check(Alder between 0 and 75),
   Placering decimal(2,1),
   PC varchar(15),
   FagId int foreign key references Fag(Id) --not null
)

create table L�rer
(
   Id int primary key,
   Navn nvarchar(30)
)

create table Fag_L�rer
(
   FagId int foreign key references Fag(Id),
   L�rerId int foreign key references L�rer(Id),
   constraint UK_FagL�rer Unique(FagId, L�rerId)
)

insert into Fag values('Engelskt')
insert into Fag values('Svenskt')
insert into Fag values('Matematikt')
insert into Fag values('Hjemkundskabt')
insert into Fag values('Gymnastikt')
insert into Fag values('Lokumsrensningt')
insert into Fag values('Sporvognsskinneskidtskraber')

insert into Elev values('Alex Skram Jensen', 'H�r og sk�g', 26, 2.5,'Skab 3 PC 10', 1002)
insert into Elev values('Balen Hassan Dezai', 'The first one', 21, 1.1, 'Skab 1 PC 2', 1000)
insert into Elev values
('Belawel Nadeem Sharif', 'Flot fyr', 23, 4.2, 'Skab 1 PC 10', 1003),
('Birk Blauner Clausen', 'Polo Kasket', 23, 1.5,'Skab 1 PC 8', 1002),    
('Casper Hilligs�e', 'Granvoksen fyr', 75, 1.4, 'Skab 4 PC 8', 1005),
('Frederik Christensen', 'Omvendt sort kasket', 24, 3.4, 'Egen PC', 1004),
('Henrik Vincents Poulsen', 'To b�rn', 41, 1.3, 'Skab 1 PC 4', 1000),
('Jacob Hytting', 'Kontroversiel', 19, 3.1, 'Skab 3 PC 8', 1000),
('Jason Timothy Tolentino Sabeniano', 'Altid tr�t', 20, 2.4, 'Skab 3 PC 5', 1004),
('Jesper Hvid Vestergaard', 'Snakker meget', 29, 3.3, 'Skab 1 PC 7', 1002),
('Jim Kleckers', 'Lidt sk�g', 25, 4.1, 'Skab 3 PC 2', 1000),
('Kevin Jan Kj�rgaard Winther', 'Endnu mere lidt (fip)sk�g', 26, 3.2, 'Skab 1 PC 6', 1001),
('Mikkel Frydenlund Hammer', 'Second to one', 21, 1.2, 'Skab 1 PC 3', 1005),
('Morten Kj�r', 'Normale fingre', 21, 3.6, 'Egen PC', 1003),
('Nicolai Jensen', 'The curling wiking', 18, 2.3, 'Skab 3 PC 3', 1001),
('Patrick Lolk', 'Hvid kasket', 21, 2.6, 'Skab 1 PC 9', 1005),
('Philip �stergaard Klein', 'Har (b�rne)k�rekort', 17, 2.1, 'Skab 4 PC 2', 1003),
('Rasmus Kanstrup Poulsen', 'Intet k�rekort m�rkebrunt sk�g', 20, 4.4, 'Skab 3 PC 7', 1005),
('Rasmus Kock Rask', 'R�d og Rask', 23, 4.3, 'Skab 3 PC 4', 1005),
('Simon Johnsen', 'Tror han er gud', 20, 2.2, 'Skab 3 PC 6', 1000),
('S�ren Vollmer Riishede', 'Ornli syg', 19, 4.6, 'Skab 3 PC 9', 1005),
('Virtus Br�dder Opstrup', 'Sidst p� listen', 18, 3.5, 'Egen PC', null)


insert into L�rer values(777, 'Jan Stern Johansen')
insert into L�rer values(778, 'Flemming S�rensen')
insert into L�rer values(779, 'John Ellehammer')
insert into L�rer values(780, 'Bo Steffensen')

insert into Fag_L�rer values(1006, 777)
insert into Fag_L�rer values(1005, 778)
insert into Fag_L�rer values(1004, 779)
insert into Fag_L�rer values(1003, 780)
insert into Fag_L�rer values(1002, 780)
insert into Fag_L�rer values(1001, 780)
insert into Fag_L�rer values(1000, 780)
--insert into Fag_L�rer values(1000, 780)

if(null=null)
begin
   print 'Null er lig med null'
end
else
begin
   print 'Null er ikke lig med null'
end

select * from Elev
where FagId = null

select * from Elev
where FagId is null







select * from Fag
select * from Elev
select * from Elev where PC like 'Skab 1%' order by PC
select * from Elev where Placering between 2.0 and 3.0

select * from Elev, Fag
where Elev.FagId = Fag.Id

select * from Elev
join Fag on Elev.FagId = Fag.Id

select * from Elev
left join Fag on Elev.FagId = Fag.Id

select * from Elev
right join Fag on Elev.FagId = Fag.Id

select * from Elev
full join Fag on Elev.FagId = Fag.Id

select * from Elev
full join Fag on Elev.FagId = Fag.Id

select * from Elev, Fag, Fag_L�rer, L�rer
where Elev.FagId = Fag.Id
and Fag.Id = Fag_L�rer.FagId
and L�rer.Id = Fag_L�rer.L�rerId

go

drop view if exists vwElevFag
go

create view vwElevFag
as
select Elev.Navn as Elevnavn, Fag.Navn as 'Fagets Navn', L�rer.Navn as [L�rers Navn] from Elev, Fag, Fag_L�rer, L�rer
where Elev.FagId = Fag.Id
and Fag.Id = Fag_L�rer.FagId
and L�rer.Id = Fag_L�rer.L�rerId
go

select * from vwElevFag
where [Fagets Navn] like 'E%k_'
go

--G�r galt, flere kolonner med samme navn
--create view vwAllElevFag
--as
--select * from Elev, Fag
--where Elev.FagId = Fag.Id







select * from INFORMATION_SCHEMA.VIEWS




                    
