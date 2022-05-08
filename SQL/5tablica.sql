# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\5tablica.sql

drop database if exists 5tablica;
create database 5tablica;
use 5tablica;

create table muzej(
    ime varchar(50),
    lokacija varchar(50),
    kustos varchar(50),
    izlozba varchar(50),
    stalnapostava varchar(50),
    kontakt varchar(50)
);

create table izlozba(
    ime varchar(50),
    slikar varchar(50),
    kustos varchar(50),
    sponzor varchar(50),
    datumizlozbe varchar(50),
    nazivslike varchar(50),
    godinaslike varchar(50)
);

create table kustos(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    izlozba varchar(50),
    kontakt varchar(50)
);


