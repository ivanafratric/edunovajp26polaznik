# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\kolokvij4.sql

drop database if exists kolokvij4;
create database kolokvij4;
use kolokvij4;

create table ostavljen(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(43),
    introvertno boolean,
    kuna decimal(14,10)
);

create table punac(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    majica varchar(46),
    jmbag char(11) not null,
    novcica decimal(18,7) not null,
    maraka decimal(12,6) not null,
    ostavljen int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura varchar(49),
    vesta varchar(34) not null
);

create table zena(
    sifra int not null primary key auto_increment,
    suknja varchar(39) not null,
    lipa decimal(18,7),
    prstena int not null
);

create table zena_mladic(
    sifra int not null primary key auto_increment,
    zena int not null,
    mladic int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    treciputa datetime,
    haljina varchar(44) not null,
    zena int not null
);

create table becar(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8),
    kratkamajica varchar(48) not null,
    bojaociju varchar(36) not null,
    snasa int not null
);


create table prijatelj(
    sifra int not null primary key auto_increment,
    eura decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag char(11) not null,
    suknja varchar(47) not null,
    becar int not null
);

alter table punac add foreign key (ostavljen) references ostavljen(sifra);

alter table zena_mladic add foreign key (mladic) references mladic(sifra);
alter table zena_mladic add foreign key (zena) references zena(sifra);

alter table snasa add foreign key (zena) references zena(sifra);
alter table becar add foreign key (snasa) references snasa(sifra);
alter table prijatelj add foreign key (becar) references becar(sifra);

insert into zena (suknja, prstena)
values ('crna', 4);

insert into zena (suknja, prstena)
values ('plava', 8);

insert into zena (suknja, prstena)
values ('zeleno-žuta', 1);

insert into snasa (haljina, zena, treciputa)
values ('dugačka', 2, '2022-04-15');

insert into snasa (haljina, zena, treciputa)
values ('kratka', 1, '1999-09-09');

insert into snasa (haljina, zena)
values ('prugasta', 3);

insert into becar (kratkamajica, bojaociju, snasa)
values ('plava', 'plava', 1);

insert into becar (kratkamajica, bojaociju, snasa)
values ('crna', 'zelena', 2);

insert into becar (kratkamajica, bojaociju, snasa)
values ('bijela', 'smeđa', 3);

insert into mladic (vesta, nausnica)
values ('topla', 52);

insert into mladic (vesta, nausnica)
values ('moderna', 5);

insert into mladic (vesta, nausnica)
values ('tanka', 8);

insert into zena_mladic (zena, mladic)
values (1, 2);

insert into zena_mladic (zena, mladic)
values (2,1);

insert into zena_mladic (zena, mladic)
values (3,3);

insert into prijatelj (prstena, jmbag, suknja, becar)
values (5, '14587965233', 'zelena', 1);

insert into prijatelj (prstena, jmbag, suknja, becar)
values (12, '77854996321', 'kratka', 2);

insert into prijatelj (prstena, jmbag, suknja, becar)
values (7, '11445588231', 'plava', 3);

update punac set majica='Osijek';

delete from prijatelj where prstena > 17;

select haljina from snasa where treciputa is null;

select a.nausnica, b.jmbag, c.kratkamajica
from mladic a inner join zena_mladic zm on a.sifra=zm.mladic 
inner join zena d on d.sifra=zm.zena 
inner join snasa e on e.zena=d.sifra 
inner join becar c on c.snasa=e.sifra 
left join prijatelj b on b.becar=c.sifra
where e.treciputa is not null and d.lipa <> 29;

select a.lipa, a.prstena from zena a
inner join zena_mladic b on a.sifra=b.zena 
where b.sifra is null;