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

