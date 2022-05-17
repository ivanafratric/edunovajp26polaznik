# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\taksisluzba.sql

drop database if exists taksisluzba;
create database taksisluzba;
use taksisluzba;

create table taksisluzba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    cijena decimal(18,2) not null,
    adresa varchar(50),
    kontakt varchar(50) not null
);

create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    vozilo int not null,
    kontakt varchar(50) not null
);

create table vozilo (
    sifra int not null primary key auto_increment,
    marka varchar(50),
    registracija varchar(10) not null,
    kilometraza int
);

create table putnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11)
);

create table clan(
    putnik int not null,
    vozac int not null
);


alter table vozac add foreign key (vozilo) references vozilo(sifra);

alter table clan add foreign key (putnik) references putnik(sifra);
alter table clan add foreign key (vozac) references vozac(sifra);

insert into vozilo (registracija)
values ('OS123SO');

insert into vozilo (registracija)
values ('OS154KL');

insert into putnik (ime, prezime, oib)
values ('Marko', 'Kil', null);

insert into putnik (ime, prezime, oib)
values ('Mario', 'Krit', null);

insert into vozac (ime, prezime, oib, vozilo, kontakt)
values ('Jela', 'Jelić', '01558763214', 1, '099/9955-582');

insert into vozac (ime, prezime, oib, vozilo, kontakt)
values ('Nino', 'Lirik', '25855963251', 2, '099/9955-583');
