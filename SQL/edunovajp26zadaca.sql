# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\edunovajp26zadaca.sql

drop database if exists edunovajp26zadaca;
create database edunovajp26zadaca;
use edunovajp26zadaca;

create table salonzauljepsavanje(
    usluga varchar(50),
    cijena varchar(50),
    lokacija varchar(50),
    djelatnik varchar(50),
    prostor varchar(50),
    email varchar(50)
);

create table djelatnik(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    email varchar(50)
);

create table usluga(
    pedikura varchar(50),
    manikura varchar(50),
    ciscenjelica varchar(50),
    depilacija varchar(50),
    obrve varchar(50)
);

create table korisnik(
    ime varchar(50),
    prezime varchar(50),
    usluga varchar(50),
    email varchar(50)
);


