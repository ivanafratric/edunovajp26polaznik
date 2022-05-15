# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\salonzauljepsavanje.sql

drop database if exists salonzauljepsavanje;
create database salonzauljepsavanje;
use salonzauljepsavanje;

create table salon(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    usluga int not null,
    cijena decimal(18,2) not null,
    djelatnik int,
    lokacija varchar(50) not null,
    kontakt varchar(20) not null
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    kontakt varchar(20) not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    vrstausluge varchar(30) not null,
    cijena decimal(18,2) not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    usluga int not null,
    djelatnik int,
    kontakt varchar(20) not null
);

alter table salon add foreign key (djelatnik) references djelatnik(sifra);

alter table salon add foreign key (usluga) references usluga(sifra);

alter table korisnik add foreign key (usluga) references usluga(sifra);

alter table korisnik add foreign key (djelatnik) references djelatnik(sifra);

insert into djelatnik (ime, prezime, oib, kontakt)
values ('Jelena', 'Rogić', '15444896631', '091/5588-885');

insert into djelatnik (ime, prezime, oib, kontakt)
values ('Anja', 'Marić', '04789622531', '099/2525-000');

insert into usluga (vrstausluge, cijena)
values ('Pedikura', '120');

insert into usluga (vrstausluge, cijena)
values ('Manikura', '150');


