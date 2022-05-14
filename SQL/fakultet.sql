# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\fakultet.sql

drop database if exists fakultet;
create database fakultet;
use fakultet;

create table fakultet(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    lokacija varchar(50) not null,
    kolegij int not null,
    kontakt varchar(50) not null
);

create table student(
    sifra int not null primary key auto_increment,
    ime varchar(20),
    prezime varchar(20),
    oib char(11) not null,
    kolegij int not null
);

create table kolegij(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    profesor varchar(50)
);

create table rok(
    sifra int not null primary key auto_increment,
    datum datetime not null,
    vrijeme datetime not null
);

create table clan(
    sifra int not null primary key auto_increment,
    student int not null,
    rok int not null
);

alter table fakultet add foreign key (kolegij) references kolegij(sifra);
alter table student add foreign key (kolegij) references kolegij(sifra);

alter table clan add foreign key (student) references student(sifra);
alter table clan add foreign key (rok) references rok(sifra);




