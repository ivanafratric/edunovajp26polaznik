# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\10tablica.sql

drop database if exists 10tablica;
create database 10tablica;
use 10tablica;

create table doktorskaordinacija(
    doktor varchar(50),
    granamedicine varchar(50),
    medicinskasestra varchar(50),
    radnovrijeme varchar(50),
    kontakt varchar(50),
    pauza varchar(50)
);

create table doktor(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    kontakt varchar(50)
);

create table pacijent(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    bolest varchar(50),
    kontakt varchar(50)
);

create table medicinskasestra(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    kontakt varchar(50)
);

