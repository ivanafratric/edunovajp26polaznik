# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\vodoinstalater.sql

drop database if exists vodoinstalater;
create database vodoinstalater;
use vodoinstalater;

create table vodoinstalater(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    kontakt varchar(50) not null,
    popravak int not null
);

create table popravak(
    sifra int not null primary key auto_increment,
    adresapopravka varchar(50) not null,
    cijena decimal(18,2) not null
);

create table kvar(
    sifra int not null primary key auto_increment,
    vrstakvara varchar(50) not null
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    iban varchar(30),
    popravak int not null
);

create table clan(
    sifra int not null primary key auto_increment,
    popravak int not null,
    kvar int not null
);

alter table vodoinstalater add foreign key (popravak) references popravak(sifra);
alter table segrt add foreign key (popravak) references popravak(sifra);

alter table clan add foreign key (popravak) references popravak(sifra);
alter table clan add foreign key (kvar) references kvar(sifra);
