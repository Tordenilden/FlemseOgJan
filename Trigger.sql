


Create table Person
(
   Id int primary key,
   Navn nvarchar(25),
   Køn char(1) check(Køn = 'M' Or Køn = 'K'),
   Alder int
)
go

Insert into Person values(1, 'Philip', 'M', 19)
Insert into Person values(2, 'Simon', 'M', 19)
Insert into Person values(3, 'Nicolai', 'M', 19)
Insert into Person values(4, 'Jason', 'M', 19)
Insert into Person values(7, 'Simon', 'M', 19)

Insert into Person values(8, 'Jan', 'M', 19)

Delete from Person
where Id = 1

Update Person set Navn = 'Jan'
where Navn = 'Simon'

select * from Person

go

Drop trigger if exists trgInsertPerson
go
Create trigger trgInsertPerson
on Person
for Insert
as
begin
   declare @Navn nvarchar(25)
   declare @Køn char(1)
   select @Navn = Navn, @Køn = Køn from Inserted
   print 'Velkommen til ' + @Navn
end

-- Opret en trigger på tabellen Person, der udløses af en delete og
-- indsætter en række i tabellen PersonHistorik
-- med navnet på den Person, der slettes.

go
Drop trigger if exists trgInsteadOfInsert
go
Create trigger trgInsteadOfInsert 
on Person
Instead of Insert
as
begin
   declare @Id int, @Navn nvarchar(25), @Køn char(1), @Alder int
   select @Id = Id, @Navn = Navn, @Køn = Køn, @Alder = Alder
   from Inserted
   if(@Køn = 'M')
   begin
      set @Køn = 'K'
   end
   else
   begin
      set @Køn = 'M'
   end
   Insert into Person values(@Id, @Navn + ' Hæ Hæ', @Køn, @Alder + 100)
end

