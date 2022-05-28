# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\kolokvij2.sql

# 0. Kreirajte tablice i veze između tablica

drop database if exists kolokvij2;
create database kolokvij2;
use kolokvij2;

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno boolean not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstroventno boolean not null,
    prviputa datetime,
    svekar int not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno boolean not null
);

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno boolean,
    vesta varchar(34),
    asocijalno boolean not null
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno boolean,
    majica varchar(40) not null,
    decko int
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno boolean not null,
    neprijatelj int not null
);

alter table prijatelj add foreign key (svekar) references svekar(sifra);

alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);

alter table cura add foreign key (decko) references decko(sifra);

alter table neprijatelj add foreign key (cura) references cura(sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

# 1. U tablice neprijatelj, cura i decko_zarucnica unesite po 3 retka

insert into neprijatelj (haljina, modelnaocala, kuna)
values ('curina', 'sunčane', 252.50);

insert into neprijatelj (haljina, modelnaocala, kuna)
values ('zelena', 'dioptrijske', 485.42);

insert into neprijatelj (haljina, modelnaocala, kuna)
values ('crna', 'lenonice', 585);

insert into cura (haljina, drugiputa, majica)
values ('mornarska', '2022-08-25', 'bijela');

insert into cura (haljina, drugiputa, majica)
values ('bijela', '2018-01-15', 'dugih rukava');

insert into cura (haljina, drugiputa, majica)
values ('zelena', '1995-10-01', 'žuta');

insert into decko (asocijalno)
values (true);

insert into decko (asocijalno)
values (true);

insert into decko (asocijalno)
values (false);

insert into zarucnica (bojakose, lipa, indiferentno)
values ('smeđa', 0.15, true);

insert into zarucnica (bojakose, lipa, indiferentno)
values ('crna', 0.99, true);

insert into zarucnica (bojakose, lipa, indiferentno)
values ('plava', 0.50, false);

insert into decko_zarucnica (decko, zarucnica)
values (1, 3);

insert into decko_zarucnica (decko, zarucnica)
values (2, 2);

insert into decko_zarucnica (decko, zarucnica)
values (3, 1);

# 2. U tablici prijatelj postavite svim zapisima kolonu treciputa na vrijednost 30. travnja 2020.

insert into svekar (ogrlica, asocijalno)
values (2, true);

insert into prijatelj (treciputa, ekstroventno, svekar)
values ('2019-02-15', true, 1);

insert into prijatelj (treciputa, ekstroventno, svekar)
values ('1998-05-14', true, 1);

insert into prijatelj (treciputa, ekstroventno, svekar)
values ('2012-08-28', false, 1);

update prijatelj set treciputa='2020-04-30';

# 3. U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica različito od 14

insert into brat (ogrlica, asocijalno, neprijatelj)
values (2, false, 1);

insert into brat (ogrlica, asocijalno, neprijatelj)
values (1, true, 2);

insert into brat (ogrlica, asocijalno, neprijatelj)
values (0, true, 3);

delete from brat where ogrlica <> 14; 

# 4. Izlistajte suknja iz tablice cura uz uvjet da vrijednost kolone drugiputa nepoznate

select suknja from cura where drugiputa is null;

# 5. Prikažite novcica iz tablice zarucnica, neprijatelj iz tablice brat te haljina iz tablice neprijatelj 
# uz uvjet da su vrijednosti kolone drugiputa iz tablice cura poznate
# te da su vrijednosti kolona vesta iz tablice decko sadrže niz znakova ba.
# Podatke posložite po haljina iz tablice neprijatelj silazno

select a.novcica, b.neprijatelj, c.haljina
from zarucnica a inner join decko_zarucnica dz on a.sifra=dz.zarucnica
inner join decko d on dz.decko=d.sifra 
inner join cura e on d.sifra=e.decko 
inner join neprijatelj c on c.cura=e.sifra 
inner join brat b on b.neprijatelj = c.sifra
where e.drugiputa is not null and d.vesta like '%ba%'
order by c.haljina desc;

# 6. Prikažite kolone vesta i asocijalno iz tablice decko čiji se primarni ključ ne nalazi u tablici decko_zarucnica 

select a.vesta, a.asocijalno from decko a left join decko_zarucnica b 
on b.decko=a.sifra where b.sifra is null;