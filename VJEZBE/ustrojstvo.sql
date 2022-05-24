# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\ustrojstvo.sql

drop database if exists ustrojstvo;
create database ustrojstvo;
use ustrojstvo;

create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar(100) not null,
    zupan int not null
);

create table opcina(
    sifra int not null primary key auto_increment,
    zupanija int not null,
    naziv varchar(50) not null
);

create table mjesto(
    sifra int not null primary key auto_increment,
    opcina int not null,
    naziv varchar(50) not null
);

create table zupan(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null
);

alter table zupanija add foreign key (zupan) references zupan(sifra);

alter table opcina add foreign key (zupanija) references zupanija(sifra);

alter table mjesto add foreign key (opcina) references opcina(sifra);

insert into zupan (sifra, ime ,prezime)
values (null, 'Ivan', 'Anušić');

insert into zupan (sifra, ime, prezime)
values (null, 'Nikola', 'Dobroslavić');

insert into zupan (sifra, ime, prezime)
values (null, 'Darko', 'Koren');

insert into zupanija (sifra, naziv, zupan)
values (null, 'Osječko-baranjska', 1);

insert into zupanija (sifra, naziv, zupan)
values (null, 'Dubrovačko-neretvanska', 2);

insert into zupanija (sifra, naziv, zupan)
values (null, 'Koprivničko-križevačka', 3); 

insert into opcina (sifra, zupanija, naziv)
values (null, 1, 'Čeminac');

insert into opcina (sifra, zupanija, naziv)
values (null, 1, 'Antunovac');

insert into opcina (sifra, zupanija, naziv)
values (null, 2, 'Mokošica');

insert into opcina (sifra, zupanija, naziv)
values (null, 2, 'Koločep');

insert into opcina (sifra, zupanija, naziv)
values (null, 3, 'Ferdinandovac');

insert into opcina (sifra, zupanija, naziv)
values (null, 3, 'Sokolovac');

insert into mjesto (sifra, opcina, naziv)
values (null, 1, 'Čeminac');

insert into mjesto (sifra, opcina, naziv)
values (null, 1, 'Grabovac');

insert into mjesto (sifra, opcina, naziv)
values (null, 2, 'Antunovac');

insert into mjesto (sifra, opcina, naziv)
values (null, 2, 'Ivanovac');

insert into mjesto (sifra, opcina, naziv)
values (null, 3, 'Mokošica');

insert into mjesto (sifra, opcina, naziv)
values (null, 3, 'Nova Mokošica');

insert into mjesto (sifra, opcina, naziv)
values (null, 4, 'Gornje Čelo');

insert into mjesto (sifra, opcina, naziv)
values (null, 4, 'Donje Čelo');

insert into mjesto (sifra, opcina, naziv)
values (null, 5, 'Ferdinandovac');

insert into mjesto (sifra, opcina, naziv)
values (null, 5, 'Brodić');

insert into mjesto (sifra, opcina, naziv)
values (null, 6, 'Sokolovac');

insert into mjesto (sifra, opcina, naziv)
values (null, 6, 'Lepavina');

update mjesto set naziv='Kozarac' where sifra=2;

update mjesto set naziv='Kalamota' where sifra=7;

update mjesto set naziv='Brodić' where sifra=9;

update mjesto set naziv='Ferdinandovac' where sifra=10;

update mjesto set naziv='Srijem' where sifra=12;

