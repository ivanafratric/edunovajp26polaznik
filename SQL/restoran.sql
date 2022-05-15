# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\restoran.sql

drop database if exists restoran;
create database restoran;
use restoran;

create table restoran(
    sifra int not null primary key auto_increment,
    naziv varchar(30) not null,
    adresa varchar(50) not null,
    kontakt varchar(50) not null,
    kategorija int not null
);

create table kategorija(
    sifra int not null primary key auto_increment,
    naziv varchar(30) not null,
    jelo int not null
);

create table jelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2) not null,
    opis varchar(100),
    normativ decimal(18,2)    
);

create table pice(
    sifra int not null primary key auto_increment,
    naziv varchar(30) not null,
    cijena decimal(18,2),
    normativ decimal(18,2)
);

create table clan(
    sifra int not null primary key auto_increment,
    jelo int not null,
    pice int not null
);

alter table restoran add foreign key (kategorija) references kategorija(sifra);

alter table kategorija add foreign key (jelo) references jelo(sifra);

alter table clan add foreign key (jelo) references jelo(sifra);
alter table clan add foreign key (pice) references pice(sifra);
