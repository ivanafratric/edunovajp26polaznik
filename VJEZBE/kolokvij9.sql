# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\kolokvij9.sql

drop database if exists kolokvij9;
create database kolokvij9;
use kolokvij9;

create table ostavljena(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(34) not null,
    suknja varchar(32),
    eura decimal(18,7) not null,
    lipa decimal(15,7) not null,
    treciputa datetime not null,
    drugiputa datetime not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    prstena int,
    drugiputa datetime not null,
    haljina varchar(38) not null,
    ostavljena int
);

create table punac(
    sifra int not null primary key auto_increment,
    narukvica int not null,
    modelnaocala varchar(30),
    kuna decimal(12,8),
    bojaociju varchar(33),
    suknja varchar(45)
);

create table prijateljica(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    novcica decimal(16,7),
    kuna decimal(14,10) not null,
    drugiputa datetime,
    haljina varchar(45),
    kratkamajica varchar(49)
);

create table punac_prijateljica(
    sifra int not null primary key auto_increment,
    punac int not null,
    prijateljica int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    vesta varchar(49) not null,
    ekstroventno boolean,
    carape varchar(37),
    suknja varchar(37) not null,
    punac int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    novcica decimal(18,9) not null,
    ekstroventno boolean,
    vesta varchar(32) not null,
    cura int
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    gustoca decimal(17,6),
    haljina varchar(40),
    kratkamajica varchar(48) not null,
    nausnica int not null,
    brat int not null
);

alter table snasa add foreign key (ostavljena) references ostavljena(sifra);

alter table punac_prijateljica add foreign key (punac) references punac(sifra);
alter table punac_prijateljica add foreign key (prijateljica) references prijateljica(sifra);

alter table cura add foreign key (punac) references punac(sifra);
alter table brat add foreign key (cura) references cura(sifra);
alter table zarucnik add foreign key (brat) references brat(sifra);

insert into brat (novcica, vesta)
values (250, 'zelena');

insert into brat (novcica, vesta)
values (150, 'plava');

insert into brat (novcica, vesta)
values (26, 'bijela');

insert into punac (narukvica)
values (5);

insert into punac (narukvica)
values (2);

insert into punac (narukvica)
values (22);

insert into cura (vesta, suknja, punac)
values ('šarena', 'bijela', 1);

insert into cura (vesta, suknja, punac)
values ('bijela', 'zelena', 1);

insert into cura (vesta, suknja, punac)
values ('crna', 'bijela', 2);

insert into prijateljica (kuna)
values (252);

insert into prijateljica (kuna)
values (126.56);

insert into prijateljica (kuna)
values (5.15);

insert into punac_prijateljica (punac, prijateljica)
values (1,1), (2,2), (3,3);

update snasa set drugiputa = '2020-04-24';

delete from zarucnik where haljina = 'AB';

select carape from cura where ekstroventno is null;

select a.kuna, f.nausnica, e.ekstroventno 
from prijateljica a inner join punac_prijateljica pp on a.sifra = pp.prijateljica 
inner join punac c on pp.punac = c.sifra 
inner join cura d on c.sifra = d.punac 
inner join brat e on d.sifra = e.cura 
inner join zarucnik f on e.sifra = f.brat
where d.ekstroventno is not null and c.modelnaocala like '%ba%'
order by e.ekstroventno desc;

select a.modelnaocala, a.kuna from punac a 
inner join punac_prijateljica b on a.sifra = b.punac 
where b.sifra is null;