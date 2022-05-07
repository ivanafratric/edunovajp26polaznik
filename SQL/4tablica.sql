# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\4tablica.sql

drop database if exists 4tablica;
create database 4tablica;
use 4tablica;

create table djecjivrtic(
    ime varchar(50),
    lokacija varchar(50),
    odgajatelj varchar(50),
    grupa varchar(50),
    kontakt varchar(50)
);

create table odgajatelj(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    grupa varchar(50),
    strucnasprema varchar(50),
    kontakt varchar(50)
);

create table grupa(
    naziv varchar(50),
    odgajatelj varchar(50),
    maksimalanbrojgrupe varchar(50),
    starostdjeteta varchar(50)
);

create table dijete(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    starostdjeteta varchar(50),
    imeroditelja varchar(50),
    kontakt varchar(50)
);

