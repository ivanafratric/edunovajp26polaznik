# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\kolokvij6.sql

drop database if exists kolokvij6;
create database kolokvij6;
use kolokvij6;

create table punac(
    sifra int not null primary key auto_increment,
    ekstroventno boolean not null,
    suknja varchar(30) not null,
    majica varchar(44) not null,
    prviputa datetime not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    hlace varchar(48) not null,
    suknja varchar(42) not null,
    ogrlica int not null,
    treciputa datetime not null,
    dukserica varchar(32) not null,
    narukvica int not null,
    punac int
 );

 create table ostavljena(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    kratkamajica varchar(39) not null,
    drugiputa datetime,
    maraka decimal(14,10)
 );

 create table prijatelj(
    sifra int not null primary key auto_increment,
    haljina varchar(35),
    prstena int not null,
    introvertno boolean,
    stilfrizura varchar(36) not null
 );

 create table prijatelj_ostavljena(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    ostavljena int not null
 );

 create table brat(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    treciputa datetime not null,
    narukvica int not null,
    hlace varchar(31),
    prijatelj int
 );

 create table zena(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8) not null,
    narukvica int not null,
    dukserica varchar(40) not null,
    haljina varchar(30),
    hlace varchar(32),
    brat int not null
 );

 create table decko(
     sifra int not null primary key auto_increment,
     prviputa datetime,
     modelnaocala varchar(41),
     nausnica int,
     zena int not null
 );

 alter table svekrva add foreign key(punac) references punac(sifra);

 alter table prijatelj_ostavljena add foreign key (prijatelj) references prijatelj(sifra);
 alter table prijatelj_ostavljena add foreign key (ostavljena) references ostavljena(sifra);

 alter table brat add foreign key (prijatelj) references prijatelj(sifra);
 alter table zena add foreign key (brat) references brat(sifra);
 alter table decko add foreign key (zena) references zena(sifra);

 insert into brat (nausnica, treciputa, narukvica)
 values (8, '2021-09-05', 8);

 insert into brat (nausnica, treciputa, narukvica)
 values (2, '2020-06-06', 5);

 insert into brat (nausnica, treciputa, narukvica)
 values (1, '2008-10-12', 1);
 
 insert into zena (novcica, narukvica, dukserica, brat)
 values (15.2, 2, 'plava', 1);

 insert into zena (novcica, narukvica, dukserica, brat)
 values (22.22, 8, 'zelena', 2);

 insert into zena (novcica, narukvica, dukserica, brat)
 values (215.2, 4, 'bijela', 1);

 insert into prijatelj (prstena, stilfrizura)
 values (4, 'kratko ošišana');

 insert into prijatelj (prstena, stilfrizura)
 values (77, 'jež frizura');

 insert into prijatelj (prstena, stilfrizura)
 values (18, 'duga kosa');

 insert into ostavljena (prviputa, kratkamajica)
 values ('2000-01-20', 'kratkih rukava');

 insert into ostavljena (prviputa, kratkamajica)
 values ('2002-12-10', 'plava');

 insert into ostavljena (prviputa, kratkamajica)
 values ('2005-03-12', 'žuta');

 insert into prijatelj_ostavljena (prijatelj, ostavljena)
 values (1,1), (2,2), (1,3);

 update svekrva set suknja ='Osijek';

delete from decko where modelnaocala < 'AB';

select narukvica from brat where treciputa is null;

select a.drugiputa, b.zena, c.narukvica
from ostavljena a inner join prijatelj_ostavljena po on a.sifra=po.ostavljena 
inner join prijatelj d on d.sifra=po.prijatelj 
inner join brat e on e.prijatelj=d.sifra 
inner join zena c on c.brat=e.sifra 
left join decko b on b.zena=c.sifra
where e.treciputa is not null and d.prstena = 219
order by c.narukvica desc;

select a.prstena, a.introvertno
from prijatelj a left join prijatelj_ostavljena b on a.sifra=b.prijatelj 
where b.sifra is null;