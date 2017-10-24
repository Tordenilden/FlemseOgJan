
-- --drop database ElevDB
--go
--create database ElevDB
--go
--use ElevDb
 --Hvad skal man gøre når man har skrevet noget nyt?????????????????????
 --Dette var fra Jan

--select name, database_id 
--from sys.Databases
--where database_id < 5

--select * from INFORMATION_SCHEMA.TABLES
--select * from ElevDB.INFORMATION_SCHEMA.TABLES
--select * from sys.tables
--drop database ElevDB
-- trallalalalalallalalal
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

drop table if exists Fag_Lærer
go
drop table if exists Fag
go
drop table if exists Lærer
go


create table Fag
(
   Id int primary key identity(1000, 1),
   Navn nvarchar(30)
)

create table dbo.Elev
(
   Id int Primary Key identity,
   Navn Nvarchar(35) not null check(Navn not like '%[^A-Å a-å]%'),
   Kendetegn Nvarchar(30),
   Alder int check(Alder between 0 and 75),
   Placering decimal(2,1),
   PC varchar(15),
   FagId int foreign key references Fag(Id) --not null
)

create table Lærer
(
   Id int primary key,
   Navn nvarchar(30)
)

create table Fag_Lærer
(
   FagId int foreign key references Fag(Id),
   LærerId int foreign key references Lærer(Id),
   constraint UK_FagLærer Unique(FagId, LærerId)
)

insert into Fag values('Engelskt')
insert into Fag values('Svenskt')
insert into Fag values('Matematikt')
insert into Fag values('Hjemkundskabt')
insert into Fag values('Gymnastikt')
insert into Fag values('Lokumsrensningt')
insert into Fag values('Sporvognsskinneskidtskraber')

insert into Elev values('Alex Skram Jensen', 'Hår og skæg', 26, 2.5,'Skab 3 PC 10', 1002)
insert into Elev values('Balen Hassan Dezai', 'The first one', 21, 1.1, 'Skab 1 PC 2', 1000)
insert into Elev values
('Belawel Nadeem Sharif', 'Flot fyr', 23, 4.2, 'Skab 1 PC 10', 1003),
('Birk Blauner Clausen', 'Polo Kasket', 23, 1.5,'Skab 1 PC 8', 1002),    
('Casper Hilligsøe', 'Granvoksen fyr', 75, 1.4, 'Skab 4 PC 8', 1005),
('Frederik Christensen', 'Omvendt sort kasket', 24, 3.4, 'Egen PC', 1004),
('Henrik Vincents Poulsen', 'To børn', 41, 1.3, 'Skab 1 PC 4', 1000),
('Jacob Hytting', 'Kontroversiel', 19, 3.1, 'Skab 3 PC 8', 1000),
('Jason Timothy Tolentino Sabeniano', 'Altid træt', 20, 2.4, 'Skab 3 PC 5', 1004),
('Jesper Hvid Vestergaard', 'Snakker meget', 29, 3.3, 'Skab 1 PC 7', 1002),
('Jim Kleckers', 'Lidt skæg', 25, 4.1, 'Skab 3 PC 2', 1000),
('Kevin Jan Kjærgaard Winther', 'Endnu mere lidt (fip)skæg', 26, 3.2, 'Skab 1 PC 6', 1001),
('Mikkel Frydenlund Hammer', 'Second to one', 21, 1.2, 'Skab 1 PC 3', 1005),
('Morten Kjær', 'Normale fingre', 21, 3.6, 'Egen PC', 1003),
('Nicolai Jensen', 'The curling wiking', 18, 2.3, 'Skab 3 PC 3', 1001),
('Patrick Lolk', 'Hvid kasket', 21, 2.6, 'Skab 1 PC 9', 1005),
('Philip Østergaard Klein', 'Har (børne)kørekort', 17, 2.1, 'Skab 4 PC 2', 1003),
('Rasmus Kanstrup Poulsen', 'Intet kørekort mørkebrunt skæg', 20, 4.4, 'Skab 3 PC 7', 1005),
('Rasmus Kock Rask', 'Rød og Rask', 23, 4.3, 'Skab 3 PC 4', 1005),
('Simon Johnsen', 'Tror han er gud', 20, 2.2, 'Skab 3 PC 6', 1000),
('Søren Vollmer Riishede', 'Ornli syg', 19, 4.6, 'Skab 3 PC 9', 1005),
('Virtus Brædder Opstrup', 'Sidst på listen', 18, 3.5, 'Egen PC', null)


insert into Lærer values(777, 'Jan Stern Johansen')
insert into Lærer values(778, 'Flemming Sørensen')
insert into Lærer values(779, 'John Ellehammer')
insert into Lærer values(780, 'Bo Steffensen')

insert into Fag_Lærer values(1006, 777)
insert into Fag_Lærer values(1005, 778)
insert into Fag_Lærer values(1004, 779)
insert into Fag_Lærer values(1003, 780)
insert into Fag_Lærer values(1002, 780)
insert into Fag_Lærer values(1001, 780)
insert into Fag_Lærer values(1000, 780)
--insert into Fag_Lærer values(1000, 780)

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

select * from Elev, Fag, Fag_Lærer, Lærer
where Elev.FagId = Fag.Id
and Fag.Id = Fag_Lærer.FagId
and Lærer.Id = Fag_Lærer.LærerId

go

drop view if exists vwElevFag
go

create view vwElevFag
as
select Elev.Navn as Elevnavn, Fag.Navn as 'Fagets Navn', Lærer.Navn as [Lærers Navn] from Elev, Fag, Fag_Lærer, Lærer
where Elev.FagId = Fag.Id
and Fag.Id = Fag_Lærer.FagId
and Lærer.Id = Fag_Lærer.LærerId
go

select * from vwElevFag
where [Fagets Navn] like 'E%k_'
go

--Går galt, flere kolonner med samme navn
--create view vwAllElevFag
--as
--select * from Elev, Fag
--where Elev.FagId = Fag.Id







select * from INFORMATION_SCHEMA.VIEWS




                    
