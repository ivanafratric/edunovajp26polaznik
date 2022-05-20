# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\katalog.sql

drop database if exists katalog;
create database katalog;
use katalog;

create table autor(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    datumrodenja datetime
);

create table izdavac(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    aktivan boolean
);

create table mjesto(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    postanskibroj varchar(20),
    drzava varchar(50)
);

create table katalog(
    sifra int not null primary key auto_increment,
    autor int not null,
    naslov varchar(100) not null,
    izdavac int not null,
    mjesto int not null,
    cijena decimal(18,2)
);

alter table katalog add foreign key (autor) references autor(sifra);
alter table katalog add foreign key (izdavac) references izdavac(sifra);
alter table katalog add foreign key (mjesto) references mjesto(sifra);

insert into mjesto (naziv, postanskibroj, drzava)
values ('Zagreb', '1000', 'Hrvatska');

insert into mjesto (naziv, postanskibroj, drzava)
values ('Kopenhagen', null, 'Danska');

insert into mjesto (naziv, sifra, drzava, postanskibroj)
values ('Rijeka', null, 'Hrvatska', '51000');

insert into autor (ime, prezime, datumrodenja)
values ('Ivana', 'Brlić Mažuranić', '1874-04-18');

insert into autor (sifra, ime, prezime, datumrodenja)
values (null, 'August', 'Šenoa', '1838-11-14');

insert into autor (ime, prezime, datumrodenja)
values ('Robert', 'Perišić', null);

insert into izdavac (naziv)
values ('Hrvatska revija');

insert into izdavac (naziv)
values ('Lavendel og rosmarin');

insert into izdavac (naziv)
values ('Riječ');

insert into izdavac (naziv)
values ('Biblioteka ON LINE');

insert into izdavac (naziv)
values ('Hrvatski pedagoški književni zbor');

insert into katalog (autor, naslov, izdavac, mjesto)
values (1, 'Mir u duši', 1, 1);

insert into katalog (autor, naslov, izdavac, mjesto)
values (1, 'Priče iz davnine', 2,2);

insert into katalog  (autor, naslov, izdavac, mjesto)
values (1, 'Čudnovate zgode šegrta Hlapića', 5, 1);

insert into katalog (autor, naslov, izdavac, mjesto)
values (2, 'Čuvaj se senjske ruke', 3, 3);

insert into katalog (autor, naslov, izdavac, mjesto)
values (2, 'Zlatarevo zlato', 3,3);


