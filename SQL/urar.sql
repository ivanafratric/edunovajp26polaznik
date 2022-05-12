# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\urar.sql

drop database if exists urar;
create database urar;
use urar;

create table urar(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    popravak int not null,
    cijena decimal(18,2) not null,
    lokacija varchar(50) not null,
    kontakt varchar(50) not null,
    segrt int not null
);

create table popravak(
    sifra int not null primary key auto_increment,
    vrstapopravka varchar(50) not null
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    kontakt varchar(50) not null,
    iban varchar(50) not null,
    popravak int not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    sat int not null,
    popravak int not null,
    kontakt varchar(50) not null
);

create table sat(
    sifra int not null primary key auto_increment,
    marka varchar(20),
    popravak int not null
);

alter table urar add foreign key (popravak) references popravak(sifra);
alter table urar add foreign key (segrt) references segrt(sifra);

alter table segrt add foreign key (popravak) references popravak(sifra);

alter table korisnik add foreign key (sat) references sat(sifra);
alter table korisnik add foreign key (popravak) references popravak(sifra);
