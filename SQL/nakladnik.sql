# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\nakladnik.sql

drop database if exists nakladnik;
create database nakladnik;
use nakladnik;

create table nakladnik(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    kontakt varchar(50) not null
);

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    autor varchar(50) not null,
    izdanje int not null
);

create table mjesto(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    adresa varchar(50) not null
);

create table clan(
    sifra int not null primary key auto_increment,
    nakladnik int not null,
    djelo int not null,
    mjesto int not null
);

alter table clan add foreign key (nakladnik) references nakladnik(sifra);
alter table clan add foreign key (djelo) references djelo(sifra);
alter table clan add foreign key (mjesto) references mjesto(sifra);
