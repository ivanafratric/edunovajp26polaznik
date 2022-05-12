# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\taksisluzba.sql

drop database if exists taksisluzba;
create database taksisluzba;
use taksisluzba;

create table taksisluzba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    cijena decimal(18,2) not null,
    vozac int not null,
    vozilo int not null,
    kontakt varchar(50) not null
);

create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    vozilo int not null,
    putnik int not null,
    kontakt varchar(50) not null
);

create table vozilo (
    sifra int not null primary key auto_increment,
    marka varchar(50),
    registracija varchar(10) not null,
    kilometraza int
);

create table putnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11)
);


alter table taksisluzba add foreign key (vozac) references vozac(sifra);
alter table taksisluzba add foreign key (vozilo) references vozilo(sifra);

alter table vozac add foreign key (putnik) references putnik(sifra);
alter table vozac add foreign key (vozilo) references vozilo(sifra);