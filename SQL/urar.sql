# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\urar.sql

drop database if exists urar;
create database urar;
use urar;

create table urar(
    naziv varchar(50),
    usluga varchar(50),
    cijena varchar(50),
    lokacija varchar(50),
    kontakt varchar(50)
);

create table usluga(
    zamjenabaterije varchar(50),
    zamjenanarukvice varchar(50),
    zamjenakazaljki varchar(50)
);

create table segrt(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    kontakt varchar(50),
    iban varchar(50)
);

create table korisnik(
    ime varchar(50),
    prezime varchar(50),
    sat varchar(50),
    usluga varchar(50),
    kontakt varchar(50)
);

