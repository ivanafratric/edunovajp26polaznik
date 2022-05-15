# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\udrugazazastituzivotinja.sql

drop database if exists udrugazazastituzivotinja;
create database udrugazazastituzivotinja;
use udrugazazastituzivotinja;

create table udruga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    sticenik int not null,
    djelatnik int,
    lokacija varchar(50),
    iban char(11) not null
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    sticenik int
);

create table sticenik(
    sifra int not null primary key auto_increment,
    ime varchar(20),
    vrstazivotinje varchar(20),
    cipiran boolean,
    zdravstvenostanje varchar(50) not null
);

create table prostor(
    sifra int not null primary key auto_increment,
    sticenik int,
    velicina varchar(20),
    ograden boolean
);

alter table udruga add foreign key (djelatnik) references djelatnik(sifra);

alter table djelatnik add foreign key (sticenik) references sticenik(sifra);

alter table prostor add foreign key (sticenik) references sticenik(sifra);

insert into sticenik (ime, vrstazivotinje, cipiran, zdravstvenostanje)
values ('Max', 'Pas', 1,'Zdrav');

insert into sticenik (ime, vrstazivotinje, cipiran, zdravstvenostanje)
values ('Eli', 'Mačka', 0, 'Dehidriran');

insert into prostor (sticenik, velicina, ograden)
values (1, '2x2m', 1);

insert into prostor (sticenik, velicina, ograden)
values (2, '1x1m', 1);

insert into djelatnik (ime, prezime, oib, sticenik)
values ('Marija', 'Murk', '14876325989', 1);

insert into djelatnik (ime, prezime, oib, sticenik)
values ('Ivona', 'Ivić', '77558963214', 2);

