# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\kud.sql

drop database if exists kud;
create database kud;
use kud;

create table kud(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    kontakt varchar(50) not null,
    plesac int not null
);

create table plesac(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    kontakt varchar(50) not null
);

create table nastup(
    sifra int not null primary key auto_increment,
    brojplesaca int not null,
    zemlja boolean,
    inozemstvo boolean,
    mjesto int not null
);

create table clan(
    plesac int not null,
    nastup int not null
);

alter table kud add foreign key (plesac) references plesac(sifra);

alter table nastup add foreign key (mjesto) references nastup(sifra);

alter table clan add foreign key (plesac) references plesac(sifra);
alter table clan add foreign key (nastup) references nastup(sifra);
