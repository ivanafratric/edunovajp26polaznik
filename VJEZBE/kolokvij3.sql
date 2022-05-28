# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\kolokvij3.sql

drop database if exists kolokvij3;
create database kolokvij3;
use kolokvij3;

create table cura(
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal (13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal (15,8),
    ogrlica int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(16,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno boolean not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,1),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno boolean not null
);

create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36),
    modelnaocala varchar(31) not null,
    prijatelj int
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    asocijalno boolean,
    kratkamajica varchar(44),
    kuna decimal(13,8) not null,
    vesta varchar(32) not null,
    snasa int
);

alter table svekar add foreign key (cura) references cura(sifra);

alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);

alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table punica add foreign key (snasa) references snasa(sifra);

insert into ostavljena (modelnaocala)
values ('okrugle');

insert into ostavljena (modelnaocala)
values ('mačkaste');

insert into ostavljena (modelnaocala)
values ('sunčane');

insert into snasa (kuna, eura, ostavljena)
values (251.45, 75, 1);

insert into snasa (kuna, eura, ostavljena)
values (152.50, 52, 3);

insert into snasa (kuna, eura, ostavljena)
values (4780.58, 175, 2);

insert into prijatelj (indiferentno)
values (true);

insert into prijatelj (indiferentno)
values (true);

insert into prijatelj (indiferentno)
values (true);

insert into brat (ogrlica, ekstroventno)
values (2, false);

insert into brat (ogrlica, ekstroventno)
values (2, true);

insert into brat (ogrlica, ekstroventno)
values (25, false);

insert into prijatelj_brat (prijatelj, brat)
values (1, 1);

insert into prijatelj_brat (prijatelj, brat)
values (2, 2);

insert into prijatelj_brat (prijatelj, brat)
values (3, 3);

