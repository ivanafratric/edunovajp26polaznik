# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\edukacija.sql

drop database if exists edukacija;
create database edukacija;
use edukacija;

create table smjer(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    trajanje int,
    cijena decimal(18,2) not null,
    upisnina decimal(18,2) not null,
    certificiran boolean
);

create table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    smjer int not null,
    datumpocetka datetime,
    maksimalnopolaznika int,
    predavac int
);

create table clan(
    sifra int not null primary key auto_increment,
    grupa int not null,
    polaznik int not null
);

create table polaznik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    brojugovora varchar(20)
);

create table predavac(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(20)
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(20),
    prezime varchar(20),
    oib char(11),
    email varchar(50)
);

alter table grupa add foreign key (smjer) references smjer(sifra);
alter table grupa add foreign key (predavac) references predavac(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);

alter table polaznik add foreign key (osoba) references osoba(sifra);

alter table predavac add foreign key (osoba) references osoba(sifra);

insert into smjer (sifra, naziv, trajanje, cijena, upisnina, certificiran)
values (null, 'Java programiranje', 130, 7000, 550, true);

insert into smjer (sifra, naziv, trajanje, cijena, upisnina, certificiran)
values (null, 'PHP programiranje', 130, 7000, 550, false);

insert into smjer (sifra, naziv, trajanje, cijena, upisnina, certificiran)
values (null, 'Računovodstvo', 100, 5000, 500, null);

insert into grupa (sifra, naziv, smjer, datumpocetka, maksimalnopolaznika, predavac)
values (null, 'JP26', 1, '2022-04-27', 20, null);

insert into grupa (sifra, naziv, smjer, datumpocetka, maksimalnopolaznika, predavac)
values (null, 'PP25', 2, '2022-04-27', 20, null);

insert into grupa (sifra, naziv, smjer, datumpocetka, maksimalnopolaznika, predavac)
values (null, 'Rač20', 3, '2022-04-27', 20, null);

insert into osoba (sifra,ime,prezime,oib,email)
values (null,'Tomislav','Jakopec',null,'tjakopec@gmail.com');

insert into osoba (sifra,prezime,ime,oib,email) values
(null,'Županić','Marko',null,'marko.zupanic8@gmail.com'),
(null,'Borić','Alen',null,'boricalen@live.com'),
(null,'Ramač','Dino',null,'dinoramac@gmail.com'),
(null,'Fratrić','Ivana',null,'ivana.fratric1@gmail.com'),
(null,'Prgić','Mihael',null,'mihaelp243@gmail.com'),
(null,'Skorup','Marko',null,'mskorup@gmail.com'),
(null,'Nađ','Filip',null,'filip.nad100@gmail.com'),
(null,'Kasapović','Vedran',null,'vedran.kasapovic@gmail.com'),
(null,'Stanić','Ivan',null,'stambaivan@yahoo.com'),
(null,'Ivan','Olujić',null,'ivan.olujic.os@gmail.com'),
(null,'Vukašin','Vaščanin',null,'vukasinvascanin0@gmail.com'),
(null,'Olujić','Ivan',null,'ivan.olujic.os@gmail.com'),
(null,'Vaščanin','Vukašin',null,'vukasinvascanin0@gmail.com'),
(null,'Zdelar','Mihael',null,'mzdelar741@gmail.com');

insert into osoba (sifra, ime, prezime, oib, email)
values (null, 'Ninoslav', 'Fratrić', null, null);

insert into osoba (sifra, ime, prezime, oib, email)
values (null, 'Mario', 'Markotić', null, null);

insert into osoba (sifra, ime, prezime, oib, email)
values (null, 'Marija', 'Brkić', null, null);

insert into osoba (sifra, ime, prezime, oib, email)
values (null, 'Jelena', 'Rogić Leš', null, null);

insert into predavac (sifra, osoba, iban)
values(null, 1, null);

insert into polaznik (sifra, osoba, brojugovora)
values (null, 2, null), (null, 3, null), (null, 4, null), (null, 5, null),
(null, 6, null), (null, 7, null), (null, 8, null), (null, 9, null), (null, 10, null),
(null, 11, null), (null, 12, null), (null, 13, null), (null, 14, null), (null, 15, null),
(null, 16, null), (null, 17, null), (null, 18, null), (null, 19, null);

insert into clan (grupa, polaznik)
values (1, 1), (1,2), (1,3), (1,4), (1,5), (1,6), (1,7), (1,8), (1,9), (1,10), (1,11), (1,12), (1,13), (1,14),
(1,15), (1,16), (1,17), (1,18);

update smjer set upisnina=600 where sifra=1;

update smjer set cijena=5000, trajanje=100 where sifra=2;

update grupa set predavac=1 where sifra=1;

update smjer set cijena=null where sifra=3;

insert into predavac (sifra, osoba, iban)
values (null, 5, null);

insert into smjer (sifra, naziv, trajanje, cijena, upisnina, certificiran)
values (null, 'Tehničar za mrežu', 130, 5000, 550, true);

update predavac set iban='HR15489653321455' where sifra=2;

insert into polaznik (sifra, osoba, brojugovora)
values (null, 16, null), (null, 17, null), (null, 18, null), (null, 19, null);

insert into clan (grupa, polaznik)
values (1, 19), (1, 20), (2, 21), (2, 22);

select a.naziv as grupa, b.naziv as smjer,
d.ime, d.prezime
from grupa a inner join smjer b 
on a.smjer=b.sifra
left join predavac c 
on a.predavac=c.sifra 
left join osoba d 
on c.osoba=d.sifra;

select a.naziv as grupa, b.polaznik as clan,
c.osoba, d.ime, d.prezime 
from grupa a inner join clan b 
on a.sifra=b.grupa
inner join polaznik c 
on b.polaznik = c.sifra 
inner join osoba d 
on c.osoba=d.sifra
where naziv='JP26';

select * from polaznik where osoba=5;
select * from osoba where ime='Ivana';
select * from grupa;

insert into clan (grupa, polaznik)
values (2, 4);

select a.naziv as grupa, b.polaznik as clan, 
c.osoba, d.ime, d.prezime
from grupa a inner join clan b 
on a.sifra = b.grupa 
inner join polaznik c 
on b.polaznik = c.sifra 
inner join osoba d
on c.osoba = d.sifra
where naziv='PP25';

delete from clan where grupa=2 and polaznik=4;

update polaznik set brojugovora='12/2022' where sifra=4;
select * from polaznik;