# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\kolokvij1.sql

drop database if exists kolokvij1;
create database kolokvij1;
use kolokvij1;

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno boolean,
    ekstroventno boolean not null,
    dukserica varchar(48) not null,
    muskarac int
);

alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

alter table zena add foreign key (sestra) references sestra(sifra);

alter table muskarac add foreign key (zena) references zena(sifra);

alter table mladic add foreign key (muskarac) references muskarac(sifra);

alter table cura add foreign key (punac) references punac(sifra);

insert into sestra (introvertno, haljina, maraka, hlace, narukvica)
values (null, 'zelena', null, 'duge', 2);

insert into sestra (introvertno, haljina, maraka, hlace, narukvica)
values (null, 'kratka', null, 'bijele', 1);

insert into sestra (introvertno, haljina, maraka, hlace, narukvica)
values (null, 'lijepa', null, 'kratke', 5);

insert into zena (treciputa, hlace, kratkamajica, jmbag, bojaociju, haljina, sestra)
values (null, null, 'bijela', '15489663257', 'plava', null, 3);

insert into zena (treciputa, hlace, kratkamajica, jmbag, bojaociju, haljina, sestra)
values (null, null, 'žuta', '25412256983', 'plava', null, 1);

insert into zena (treciputa, hlace, kratkamajica, jmbag, bojaociju, haljina, sestra)
values (null, null, 'crvena', '58987841251', 'zelena', null, 2);

insert into muskarac (bojaociju, hlace, modelnaocala, maraka, zena)
values ('smeđa', null, null, 14, 1);

insert into muskarac (bojaociju, hlace, modelnaocala, maraka, zena)
values ('smeđa', null, null, 20, 2);

insert into muskarac (bojaociju, hlace, modelnaocala, maraka, zena)
values ('plava', null, null, 15, 3);

insert into svekar (bojaociju, prstena, dukserica, lipa, eura, majica)
values ('plava', null, null, null, null, null);

insert into svekar (bojaociju, prstena, dukserica, lipa, eura, majica)
values ('smeđa', null, null, null, null, null);

insert into svekar (bojaociju, prstena, dukserica, lipa, eura, majica)
values ('zelena', null, null, null, null, null);

insert into sestra_svekar (sestra, svekar)
values (1,3), (2,2), (3,1);

insert into cura (novcica, gustoca, lipa, ogrlica, bojakose, suknja, punac)
values (125.30, 22, null, 2, null, null, null);

insert into cura (novcica, gustoca, lipa, ogrlica, bojakose, suknja, punac)
values (325.30, 53, null, 3, null, null, null);

insert into cura (novcica, gustoca, lipa, ogrlica, bojakose, suknja, punac)
values (88.80, 88, null, 1, null, null, null);

update cura set gustoca=15.77;

insert into mladic (suknja, kuna, drugiputa, asocijalno, ekstroventno, dukserica, muskarac)
values ('zelena', 158.32, null, null, true, 'bijela', null);

insert into mladic (suknja, kuna, drugiputa, asocijalno, ekstroventno, dukserica, muskarac)
values ('žuta', 225, null, null, true, 'bijela', null);

insert into mladic (suknja, kuna, drugiputa, asocijalno, ekstroventno, dukserica, muskarac)
values ('plava', 15.55, null, null, true, 'crna', null);

delete from mladic where kuna >15.78;  

select kratkamajica from zena where hlace like '%ana%';



