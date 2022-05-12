# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\muzej.sql

drop database if exists muzej;
create database muzej;
use muzej;

create table muzej(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    lokacija varchar(50) not null,
    kustos int not null,
    izlozba int not null,
    stalnapostava varchar(50),
    kontakt varchar(20) not null
);

create table izlozba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    slikar varchar(50) not null,
    kustos varchar(50),
    sponzor varchar(50),
    datumizlozbe datetime not null,
    nazivslike varchar(50) not null,
    godinaslike varchar(50)
);

create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    izlozba int not null,
    kontakt varchar(20) not null
);



