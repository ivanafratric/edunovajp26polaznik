# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\ustrojstvo.sql

drop database if exists ustrojstvo;
create database ustrojstvo;
use ustrojstvo;

create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar(100) not null,
    zupan int not null
);

create table opcina(
    sifra int not null primary key auto_increment,
    zupanija int not null,
    naziv varchar(50) not null
);

create table mjesto(
    sifra int not null primary key auto_increment,
    opcina int not null,
    naziv varchar(50) not null
);

create table zupan(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null
);

alter table zupanija add foreign key (zupan) references zupan(sifra);

alter table opcina add foreign key (zupanija) references zupanija(sifra);

alter table mjesto add foreign key (opcina) references opcina(sifra);
