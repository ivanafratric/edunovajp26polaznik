# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\frizerskisalon.sql

drop database if exists frizerskisalon;
create database frizerskisalon;
use frizerskisalon;

create table frizerskisalon(
    sifra int not null primary key auto_increment,
    usluga int not null,
    cijena decimal(18,2) not null,
    lokacija varchar(50) not null,
    djelatnik int,
    prostor varchar(20),
    email varchar(100) not null
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    email varchar(50) not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    vrstausluge varchar(20) not null,
    cijena decimal(18,2) not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    usluga int not null not null,
    djelatnik int not null,
    email varchar(50) not null
);

alter table frizerskisalon add foreign key (djelatnik) references djelatnik(sifra);

alter table korisnik add foreign key (djelatnik) references djelatnik(sifra);

alter table korisnik add foreign key (usluga) references usluga(sifra);


insert into djelatnik (ime, prezime, oib, email)
values ('Mirela', 'Marić', '14585967231', 'mirela.maric@gmail.com');

insert into djelatnik (ime, prezime, oib, email)
values ('Josipa', 'Križić', '44885967422', 'josipa.krizic@gmail.com');

insert into usluga (vrstausluge, cijena)
values ('Feniranje', 50);

insert into usluga (vrstausluge, cijena)
values ('Bojanje', 160);

insert into korisnik (ime, prezime, usluga, djelatnik, email)
values ('Maja', 'Rad', 1, 2, 'maja.rad@gmail.com');

insert into korisnik (ime, prezime, usluga, djelatnik, email)
values ('Jana', 'Bilić', 1, 2, 'jana.bilic@gmail.com');








