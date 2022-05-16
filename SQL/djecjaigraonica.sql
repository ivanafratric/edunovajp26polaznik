# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\djecjaigraonica.sql

drop database if exists djecjaigraonica;
create database djecjaigraonica;
use djecjaigraonica;

create table djecjaigraonica(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    maksimalanbrojdjece int,
    skupina int not null
);

create table skupina(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    maksimalanbrojdjece int not null,
    teta int not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    starost int not null
);

create table teta(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11)
);

create table clan(
    sifra int not null primary key auto_increment,
    skupina int not null,
    dijete int not null
);

alter table djecjaigraonica add foreign key (skupina) references skupina(sifra);

alter table skupina add foreign key (teta) references teta(sifra);

alter table clan add foreign key (skupina) references skupina(sifra);
alter table clan add foreign key (dijete) references dijete(sifra);

