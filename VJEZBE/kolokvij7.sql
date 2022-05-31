# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\kolokvij7.sql

drop database if exists kolokvij7;
create database kolokvij7;
use kolokvij7;

create table cura(
    sifra int not null primary key auto_increment,
    lipa decimal(12,9) not null,
    introvertno boolean,
    modelnaocala varchar(40),
    narukvica int,
    treciputa datetime,
    kuna decimal(14,9)
);

create table punica(
    sifra int not null primary key auto_increment,
    majica varchar(40),
    eura decimal(12,6) not null,
    prstena int,
    cura int not null
);

 create table mladic(
     sifra int not null primary key auto_increment,
     prstena int,
     lipa decimal(14,5) not null,
     narukvica int not null,
     drugiputa datetime not null
 );

 create table zarucnik(
     sifra int not null primary key auto_increment,
     vesta varchar(34),
     asocijalno boolean not null,
     modelnaocala varchar(43),
     narukvica int not null,
     novcica decimal(14,5) not null
 );

 create table zarucnik_mladic(
     sifra int not null primary key auto_increment,
     zarucnik int not null,
     mladic int not null
 );

 create table ostavljen(
     sifra int not null primary key auto_increment,
     lipa decimal(14,6),
     introvertno boolean not null,
     kratkamajica varchar(38) not null,
     prstena int not null,
     zarucnik int
 );

 create table prijateljica(
     sifra int not null primary key auto_increment,
     haljina varchar(45),
     gustoca decimal(15,10) not null,
     ogrlica int,
     novcica decimal(12,5),
     ostavljen int
 );

 create table sestra(
     sifra int not null primary key auto_increment,
     bojakose varchar(34) not null,
     hlace varchar(36) not null,
     lipa decimal(15,6),
     stilfrizura varchar(40) not null,
     maraka decimal(12,8) not null,
     prijateljica int
 );

 alter table punica add foreign key (cura) references cura(sifra);

 alter table zarucnik_mladic add foreign key (zarucnik) references zarucnik(sifra);
 alter table zarucnik_mladic add foreign key (mladic) references mladic(sifra);

 alter table ostavljen add foreign key (zarucnik) references zarucnik(sifra);
 alter table prijateljica add foreign key (ostavljen) references ostavljen(sifra);
 alter table sestra add foreign key (prijateljica) references prijateljica(sifra);
 