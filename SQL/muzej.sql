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
    kustos int not null,
    sponzor int not null,
    datumizlozbe datetime not null,
    nazivslike varchar(50) not null,
    godinaslike varchar(50)
);

create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    kontakt varchar(20) not null
);

create table sponzor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    iznosdonacije decimal(18,2)
);

alter table muzej add foreign key (izlozba) references izlozba(sifra);
alter table muzej add foreign key (kustos) references kustos(sifra);

alter table izlozba add foreign key (kustos) references kustos(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);

