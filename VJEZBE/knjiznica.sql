# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\GitHub\Vjezbanje\knjiznica.sql

select * from mjesto;

select * from mjesto where sifra=2;
select postanskibroj, 'fiksni tekst', length(naziv) from mjesto where sifra=2;

select postanskibroj as 'Poštanski broj', length(naziv) as 'Broj znakova u nazivu mjesta' from mjesto where sifra=2;

select sifra, ime, prezime, datumrodenja from autor where sifra=2;
select naziv, aktivan from izdavac where sifra=2;

select naziv, postanskibroj from mjesto where sifra>2 and postanskiBroj is null;
select naziv, postanskibroj from mjesto where not (sifra>2 and postanskibroj is null);

select ime, prezime from autor where sifra!=2 and datumrodenja between '1980-01-01' and '1980-02-01';

select ime, prezime from autor where (sifra>=2 and sifra<=4) or (sifra>15452 and sifra<15460);
select naziv from izdavac where sifra not in (414, 490, 696);

select naziv from izdavac where naziv like 'a%';
select naziv from izdavac where naziv like '%nt';
select naziv from izdavac where naziv like 'a%k';
select naziv from izdavac where naziv like '%obrt%';

select distinct length(ime) from autor;

select ime, prezime from autor;
select naslov from katalog where naslov like '%ljub%';
select postanskibroj from mjesto where postanskiBroj is not null;
select naziv from mjesto where not (sifra<3000 and sifra>2000);
select naziv from mjesto where naziv like 'y%';
select datumrodenja from autor where datumrodenja = '1980-12-07';
select naziv from izdavac where naziv like '%.' and aktivan is not null;
select naziv from izdavac where sifra not in (346, 234, 589) and aktivan is null;
select autor, naslov, izdavac, mjesto from katalog where naslov like '%ljubav%' or sifra>3000;

select sifra from autor where ime='August' and prezime like '%enoa';
select naslov from katalog where autor = 2;

select b.naslov
from autor a inner join katalog b on a.sifra=b.autor
where naslov='%zlato%';

select b.naslov, d.naziv 
from autor a inner join katalog b on a.sifra=b.autor 
inner join izdavac c on b.izdavac=c.sifra 
inner join mjesto d on b.mjesto=d.sifra
where a.datumrodenja between '1976-01-01' and '1977-01-01' and c.aktivan=1;

select a.naslov, b.naziv
from katalog a inner join mjesto b on a.mjesto=b.sifra 
where a.naslov like '%ljub%';

select * from katalog where naslov like '%ljub%';

select * from izdavac where naziv like '%d%o%o%';

select * from autor;

insert into autor (sifra, ime, prezime)
values (4, 'Ivana', 'Fratrić');

insert into katalog (sifra, autor, naslov, izdavac, mjesto)
values (10, 4, 'Koko i duhovi', 3, 4);

select * from katalog;
select * from izdavac;
select * from mjesto;

update autor set datumrodenja = '2022-05-31' where sifra=4;

alter table katalog add column cijena decimal(18,2);