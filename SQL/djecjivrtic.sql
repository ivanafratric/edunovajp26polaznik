# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\djecjivrtic.sql

drop database if exists djecjivrtic;
create database djecjivrtic;
use djecjivrtic;

create table djecjivrtic(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    lokacija varchar(50) not null,
    odgajatelj int,
    grupa int,
    kontakt varchar(20) not null
);

create table odgajatelj(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    grupa int,
    strucnasprema varchar(30) not null,
    kontakt varchar(20) not null
);

create table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    odgajatelj int,
    maksimalanbrojgrupe int,
    starostdjeteta int
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    grupa int not null,
    odgajatelj int,
    starostdjeteta int not null,
    imeroditelja varchar(50) not null,
    kontakt varchar(20) not null
);

alter table djecjivrtic add foreign key (odgajatelj) references odgajatelj(sifra);
alter table djecjivrtic add foreign key (grupa) references grupa(sifra);

alter table dijete add foreign key (grupa) references grupa(sifra);
alter table dijete add foreign key (odgajatelj) references odgajatelj(sifra);

alter table grupa add foreign key (odgajatelj) references odgajatelj(sifra);
alter table odgajatelj add foreign key (grupa) references grupa(sifra);

