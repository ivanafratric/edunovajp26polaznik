# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\8tablica.sql

drop database if exists 8tablica;
create database 8tablica;
use 8tablica;

create table postolar(
    naziv varchar(50),
    usluga varchar(50),
    cijena varchar(50),
    lokacija varchar(50),
    kontakt varchar(50)
);

create table usluga(
    zamjenapotplata varchar(50),
    zamjenauloska varchar(50),
    zamjenapatenta varchar(50)
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
    obuca varchar(50),
    usluga varchar(50),
    kontakt varchar(50)
);

