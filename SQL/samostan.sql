# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\samostan.sql

drop database if exists samostan;
create database samostan;
use samostan;

create table samostan(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    red varchar(50),
    lokacija varchar(50),
    svecenik int not null,
    nadredenisvecenik int not null
);

create table svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    zaduzenje varchar(50) not null,
    nadredenisvecenik int not null
);

alter table samostan add foreign key (svecenik) references svecenik(sifra);

alter table svecenik add foreign key (nadredenisvecenik) references svecenik(sifra);


