# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\2zadaca.sql

drop database if exists 2zadaca;
create database 2zadaca;
use 2zadaca;

create table udruga(
    naziv varchar(50),
    sticenik varchar(50),
    djelatnik varchar(50),
    lokacija varchar(50),
    iban varchar(50)
);

create table djelatnik(
    ime varchar(50),
    prezime varchar(50),
    oib varchar(50),
    sticenik varchar(50)
);

create table sticenik(
    ime varchar(50),
    vrstazivotinje varchar(50),
    cipiran varchar(50),
    zdravstvenostanje varchar(50)
);

create table prostor(
    sticenik varchar(50),
    velicina varchar(50),
    ograden varchar(50)
);

