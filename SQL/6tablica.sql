# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\6tablica.sql

drop database if exists 6tablica;
create database 6tablica;
use 6tablica;

create table samostan(
    ime varchar(50),
    red varchar(50),
    lokacija varchar(50),
    svecenik varchar(50)
);

create table svecenik(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    zaduzenje varchar(50),
    nadredenisvecenik varchar(50)
);

create table nadredenisvecenik(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    svecenik varchar(50)
);

