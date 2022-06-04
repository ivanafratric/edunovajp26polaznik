# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\kolokvij8.sql

drop database if exists kolokvij8;
create database kolokvij8;
use kolokvij8;

create table prijateljica(
    sifra int not null primary key auto_increment,
    vesta varchar(50),
    nausnica int not null,
    introvertno boolean not null
);

create table cura(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    indiferentno boolean,
    ogrlica int not null,
    gustoca decimal(12,6),
    drugiputa datetime,
    vesta varchar(33),
    prijateljica int
);

create table decko(
    sifra int not null primary key auto_increment,
    kuna decimal(12,10),
    lipa decimal(17,10),
    bojakose varchar(44),
    treciputa datetime not null,
    ogrlica int not null,
    ekstroventno boolean not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    haljina varchar(47),
    drugiputa datetime not null,
    treciputa datetime
);

create table muskarac_decko(
    sifra int not null primary key auto_increment,
    muskarac int not null,
    decko int not null
);

create table becar(
    sifra int not null primary key auto_increment,
    eura decimal(15,10) not null,
    treciputa datetime,
    prviputa datetime,
    muskarac int not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(44),
    introvertno boolean,
    indiferentno boolean,
    ogrlica int not null,
    becar int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    novcica decimal(14,7) not null,
    treciputa datetime,
    neprijatelj int
);

alter table cura add foreign key (prijateljica) references prijateljica(sifra);

alter table muskarac_decko add foreign key (muskarac) references muskarac(sifra);
alter table muskarac_decko add foreign key (decko) references decko (sifra);

alter table becar add foreign key (muskarac) references muskarac(sifra);
alter table neprijatelj add foreign key (becar) references becar(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

insert into muskarac (drugiputa)
values ('2022-01-15');

insert into muskarac (drugiputa)
values ('2021-02-16');

insert into muskarac (drugiputa)
values ('2012-05-01');

insert into becar (eura, muskarac)
values (25.45, 3);

insert into becar (eura, muskarac)
values (223.25, 1);

insert into becar (eura, muskarac)
values (125, 2);

insert into neprijatelj (ogrlica, becar)
values (2, 1);

insert into neprijatelj (ogrlica, becar)
values (22, 2);

insert into neprijatelj (ogrlica, becar)
values (11, 3);

insert into decko (treciputa, ogrlica, ekstroventno)
values ('2022-02-14', 5, 1);

insert into decko (treciputa, ogrlica, ekstroventno)
values ('2012-03-16', 45, 1);

insert into decko (treciputa, ogrlica, ekstroventno)
values ('1999-10-14', 52, 0);

insert into muskarac_decko (muskarac, decko)
values (1,1), (2,2), (3,3);

update cura set indiferentno = 0;

delete from brat where novcica !=12.75;

select prviputa from becar where treciputa is null;

select a.bojakose, b.neprijatelj, c.introvertno from decko a 
inner join muskarac_decko md on a.sifra = md.decko 
inner join muskarac d on md.muskarac = d.sifra 
inner join becar e on d.sifra = e.muskarac 
inner join neprijatelj c on e.sifra = c.becar 
inner join brat b on b.neprijatelj = b.sifra
where e.treciputa is not null and d.drugiputa is not null
order by c.introvertno desc;

select a.drugiputa, a.treciputa from muskarac a
inner join muskarac_decko b on a.sifra = b.muskarac 
where b.sifra is null;