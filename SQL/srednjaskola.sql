# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\srednjaskola.sql

drop database if exists srednjaskola;
create database srednjaskola;
use srednjaskola;

create table srednjaskola(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    lokacija varchar(50),
    kontakt varchar(50),
    razred int not null
);

create table razred(
    sifra int not null primary key auto_increment,
    naziv varchar(10) not null,
    brojucenika int,
    smjer varchar(30) not null
);

create table ucenik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    kontakt varchar(50),
    razred int not null
);

create table profesor(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    kontakt varchar(50),
    iban varchar(30)
);

create table clan(
    sifra int not null primary key auto_increment,
    razred int not null,
    profesor int not null
);

alter table srednjaskola add foreign key (razred) references razred(sifra);
alter table ucenik add foreign key (razred) references razred(sifra);

alter table clan add foreign key (razred) references razred(sifra);
alter table clan add foreign key (profesor) references profesor(sifra);

