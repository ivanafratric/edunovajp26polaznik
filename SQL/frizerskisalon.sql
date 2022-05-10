# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\frizerskisalon.sql

drop database if exists frizerskisalon;
create database frizerskisalon;
use frizerskisalon;

create table frizerskisalon(
    sifra int not null primary key auto_increment,
    usluga int not null,
    cijena decimal(18,2) not null,
    lokacija varchar(50) not null,
    djelatnik int,
    prostor varchar(20),
    email varchar(100) not null
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    email varchar(50) not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    sisanje varchar(20) not null,
    feniranje varchar(20) not null,
    bojanje varchar(20) not null,
    pranjekose varchar(20) not null,
    pramenovi varchar(20) not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    usluga int not null not null,
    djelatnik int not null,
    email varchar(50) not null
);

alter table frizerskisalon add foreign key (djelatnik) references djelatnik(sifra);

alter table korisnik add foreign key (djelatnik) references djelatnik(sifra);

alter table korisnik add foreign key (usluga) references usluga(sifra);


