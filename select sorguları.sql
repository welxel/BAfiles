select * from film
select adi, yapimyili, gisesi from Film
select adi as [Adý], yapimyili as [Yapým Yýlý], gisesi as Giþesi from [Film]
select adi as [Adý], yapimyili as [Yapým Yýlý], gisesi as Giþesi from [Film] as Movie
select * from oyuncu
select 'Çaðýl Alsaç' as Ýsim
select 1 as [1. Sayý], 7 as [2. Sayý], 1 + 7 as Toplam
select adi + ' ' + soyadi as Ýsim, dogumtarihi from Oyuncu
select 'Çaðýl' + ';' + 'Alsaç'
select adi + ' ' + soyadi as Ýsim, CONVERT(varchar(10), dogumtarihi, 104) as dogumtarihi from Oyuncu

select GETDATE()

select CONVERT(varchar(19), GETDATE(), 113)
