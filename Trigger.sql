


Create table Person
(
   Id int primary key,
   Navn nvarchar(25),
   K�n char(1) check(K�n = 'M' Or K�n = 'K'),
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
   declare @K�n char(1)
   select @Navn = Navn, @K�n = K�n from Inserted
   print 'Velkommen til ' + @Navn
end

-- Opret en trigger p� tabellen Person, der udl�ses af en delete og
-- inds�tter en r�kke i tabellen PersonHistorik
-- med navnet p� den Person, der slettes.

go
Drop trigger if exists trgInsteadOfInsert
go
Create trigger trgInsteadOfInsert 
on Person
Instead of Insert
as
begin
   declare @Id int, @Navn nvarchar(25), @K�n char(1), @Alder int
   select @Id = Id, @Navn = Navn, @K�n = K�n, @Alder = Alder
   from Inserted
   if(@K�n = 'M')
   begin
      set @K�n = 'K'
   end
   else
   begin
      set @K�n = 'M'
   end
   Insert into Person values(@Id, @Navn + ' H� H�', @K�n, @Alder + 100)
end

