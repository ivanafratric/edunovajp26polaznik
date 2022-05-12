# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\taksisluzba.sql

drop database if exists taksisluzba;
create database taksisluzba;
use taksisluzba;

create table taksisluzba(
    ime varchar(50),
    cijena varchar(50),
    vozac varchar(50),
    vozilo varchar(50),
    kontakt varchar(50)
);

create table vozac(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    vozilo varchar(50),
    putnik varchar(50),
    kontakt varchar(50)
);

create table vozilo (
    marka varchar(50),
    registracija varchar(50),
    kilometraza varchar(50),
    vozac varchar(50)
);

