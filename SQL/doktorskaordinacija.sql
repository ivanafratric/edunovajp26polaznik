# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\doktorskaordinacija.sql

drop database if exists doktorskaordinacija;
create database doktorskaordinacija;
use doktorskaordinacija;

create table doktorskaordinacija(
    sifra int not null primary key auto_increment,
    doktor int not null,
    granamedicine varchar(50) not null,
    medicinskasestra int not null,
    radnovrijeme varchar(50) not null,
    kontakt varchar(50) not null,
    pauza varchar(50)
);

create table doktor(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    kontakt varchar(50)
);

create table pacijent(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    bolest varchar(50),
    kontakt varchar(50)
);

create table medicinskasestra(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    kontakt varchar(50) not null
);

create table clan(
    doktor int not null,
    pacijent int not null,
    medicinskasestra int not null
);


alter table doktorskaordinacija add foreign key (doktor) references doktor(sifra);
alter table doktorskaordinacija add foreign key (medicinskasestra) references medicinskasestra(sifra);

alter table clan add foreign key (doktor) references doktor(sifra);
alter table clan add foreign key (pacijent) references pacijent(sifra);
alter table clan add foreign key (medicinskasestra) references medicinskasestra(sifra);

insert into pacijent (ime, prezime, bolest, kontakt)
values ('Ivo', 'Ivić', 'Prehlada', '091/8878-654');

insert into pacijent (ime, prezime, bolest, kontakt)
values ('Ivica', 'Mikić', 'Upala krajnika', '099/6658-123'); 

insert into doktor (ime, prezime, kontakt)
values ('Miro', 'Ćutić', 'miro.cutic@doktor.hr');

insert into doktor (ime, prezime, kontakt)
values ('Miro', 'Ćutić', 'miro.cutic@doktor.hr');

insert into medicinskasestra (ime, prezime, kontakt)
values ('Sanja', 'Radić', 'miro.cutic@doktor.hr');

insert into medicinskasestra (ime, prezime, kontakt)
values ('Iva', 'Mihić', 'miro.cutic@doktor.hr');

insert into clan (doktor, pacijent, medicinskasestra)
values (1, 1, 1); 

insert into clan (doktor, pacijent, medicinskasestra)
values (1, 2, 2);
