# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\klub.sql

drop database if exists klub;
create database klub;
use klub;

create table klub(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    kontakt varchar(50),
    citatelj int not null,
    knjiga int not null
);

create table citatelj(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    clanskibroj int not null
);

create table knjiga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    autor varchar(50) not null,
    izdanje datetime,
    vlasnik int not null
);

create table clan(
    sifra int not null primary key auto_increment,
    citatelj int not null,
    knjiga int not null
);

alter table klub add foreign key (citatelj) references citatelj(sifra);
alter table klub add foreign key (knjiga) references knjiga(sifra);

alter table knjiga add foreign key(vlasnik) references knjiga(sifra);

alter table clan add foreign key (citatelj) references citatelj(sifra);
alter table clan add foreign key (knjiga) references knjiga(sifra);
