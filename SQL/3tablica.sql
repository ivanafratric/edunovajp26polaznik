# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\3tablica.sql

drop database if exists 3tablica;
create database 3tablica;
use 3tablica;

create table frizerskisalon(
    ime varchar(50),
    usluga varchar(50),
    cijena varchar(50),
    lokacija varchar(50),
    kontakt varchar(50)
);

create table djelatnik(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    kontakt varchar(50)
);

create table usluga(
    sisanje varchar(50),
    feniranje varchar(50),
    bojanje varchar(50),
    pranjekose varchar(50),
    pramenovi varchar(50)
);

create table korisnik(
    ime varchar(50),
    prezime varchar(50),
    usluga varchar(50),
    kontakt varchar(50)
);

