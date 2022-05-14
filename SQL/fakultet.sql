# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\fakultet.sql

drop database if exists fakultet;
create database fakultet;
use fakultet;

create table fakultet(
    naziv varchar(50) not null,
    lokacija varchar(50) not null,
    kolegij int not null,
    kontakt varchar(50) not null
);

create table student(
    ime varchar(20),
    prezime varchar(20),
    oib char(11) not null,
    kolegij int not null
);

create table kolegij(
    naziv varchar(50) not null,
    profesor varchar(50)
);

create table rok(
    datum datetime not null,
    vrijeme datetime not null
);

create table clan(
    student int not null,
    rok int not null
);


