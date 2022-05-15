# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\trgovackicentar.sql

drop database if exists trgovackicentar;
create database trgovackicentar;
use trgovackicentar;

create table trgovackicentar(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    kontakt varchar(50) not null,
    trgovina int not null
);

create table trgovina(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    asortiman varchar(50) not null,
    kontakt varchar(50) not null,
    sef int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    kontakt varchar(50) not null,
    iban varchar(30),
    sef int not null
);

create table clan(
    sifra int not null primary key auto_increment,
    trgovina int not null,
    osoba int not null
);

alter table trgovackicentar add foreign key (trgovina) references trgovina(sifra);

alter table trgovina add foreign key (sef) references trgovina(sifra);
alter table osoba add foreign key (sef) references osoba(sifra);

alter table clan add foreign key (trgovina) references trgovina(sifra);
alter table clan add foreign key (osoba) references osoba(sifra);

