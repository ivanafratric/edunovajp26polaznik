# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\doktorskaordinacija.sql

drop database if exists doktorskaordinacija;
create database doktorskaordinacija;
use doktorskaordinacija;

create table doktorskaordinacija(
    sifra int not null primary key auto_increment,
    doktor int not null,
    granamedicine varchar(50) not null,
    medicinskasestra int not null,
    radnovrijeme varchar(50) not null,
    kontakt varchar(50) not null,
    pauza varchar(50)
);

create table doktor(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    kontakt varchar(50),
    pacijent int not null
);

create table pacijent(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    bolest varchar(50),
    kontakt varchar(50)
);

create table medicinskasestra(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    kontakt varchar(50) not null,
    pacijent int not null
);


alter table doktorskaordinacija add foreign key (doktor) references doktor(sifra);
alter table doktorskaordinacija add foreign key (medicinskasestra) references medicinskasestra(sifra);

alter table doktor add foreign key (pacijent) references pacijent(sifra);
alter table medicinskasestra add foreign key (pacijent) references pacijent(sifra);
