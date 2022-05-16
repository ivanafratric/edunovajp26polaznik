# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\odvjetnik.sql

drop database if exists odvjetnik;
create database odvjetnik;
use odvjetnik;

create table odvjetnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    adresa varchar(50),
    kontakt varchar(50) not null,
    suradnik int not null
);

create table klijent(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    obrana int not null
);

create table obrana(
    sifra int not null primary key auto_increment,
    slucaj varchar(50) not null,
    svjedok varchar(50) not null
);

create table suradnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    kontakt varchar(50)
);

create table clan(
    sifra int not null primary key auto_increment,
    odvjetnik int not null,
    klijent int not null,
    obrana int not null,
    suradnik int not null
);

alter table odvjetnik add foreign key (suradnik) references suradnik(sifra);

alter table clan add foreign key (odvjetnik) references odvjetnik(sifra);
alter table clan add foreign key (klijent) references klijent(sifra);
alter table clan add foreign key (obrana) references obrana(sifra);
alter table clan add foreign key (suradnik) references suradnik(sifra);

