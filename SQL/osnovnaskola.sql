# C:\xampp\mysql\bin\mysql -uroot < C:\Users\38591\Documents\github\edunovajp26polaznik\SQL\osnovnaskola.sql

drop database if exists osnovnaskola;
create database osnovnaskola;
use osnovnaskola;

create table osnovnaskola(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    lokacija varchar(50) not null,
    kontakt varchar(50) not null,
    radionica int not null,
    uciteljica int not null
);

create table radionica(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    datumpocetka datetime not null,
    uciteljica int not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20),
    oib char(11) not null
);

create table uciteljica(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    kontakt varchar(50) not null
);

create table clan(
    sifra int not null primary key auto_increment,
    dijete int not null,
    radionica int not null
);

alter table osnovnaskola add foreign key (radionica) references radionica(sifra);
alter table osnovnaskola add foreign key (uciteljica) references uciteljica(sifra);

alter table radionica add foreign key (uciteljica) references uciteljica(sifra);

alter table clan add foreign key (dijete) references dijete(sifra);
alter table clan add foreign key (radionica) references radionica(sifra);


