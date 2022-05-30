# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\edunovajp26polaznik\VJEZBE\kolokvij5.sql

drop database if exists kolokvij5;
create database kolokvij5;
use kolokvij5;

create table zarucnik(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    lipa decimal(12,8),
    indiferentno boolean not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(48) not null,
    haljina varchar(30) not null,
    asocijalno boolean,
    zarucnik int
);

create table cura(
    sifra int not null primary key auto_increment,
    carape varchar(41) not null,
    maraka decimal(17,10) not null,
    asocijalno boolean,
    vesta varchar(47) not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojakose varchar(33),
    majica varchar(31),
    carape varchar(31) not null,
    haljina varchar(43),
    narukvica int,
    eura decimal(14,5) not null
    );

    create table svekar_cura(
        sifra int not null primary key auto_increment,
        svekar int not null,
        cura int not null
    );

    create table punac(
        sifra int not null primary key auto_increment,
        dukserica varchar(33),
        prviputa datetime not null,
        majica varchar(36),
        svekar int not null
    );

    create table punica(
        sifra int not null primary key auto_increment,
        hlace varchar(43) not null,
        nausnica int not null,
        ogrlica int,
        vesta varchar(49) not null,
        modelnaocala varchar(31) not null,
        treciputa datetime not null,
        punac int not null
    );

    create table ostavljena(
        sifra int not null primary key auto_increment,
        majica varchar(33),
        ogrlica int not null,
        carape varchar(44),
        stilfrizura varchar(42),
        punica int not null
    );

    alter table mladic add foreign key (zarucnik) references zarucnik(sifra);

    alter table svekar_cura add foreign key (svekar) references svekar(sifra);
    alter table svekar_cura add foreign key (cura) references cura(sifra);

    alter table ostavljena add foreign key (punica) references punica(sifra);
    alter table punica add foreign key (punac) references punac(sifra);
    alter table punac add foreign key (svekar) references svekar(sifra);

    insert into svekar (carape, eura)
    values ('crne', 5.8);

    insert into svekar (carape, eura)
    values ('sive', 10.50);

    insert into svekar (carape, eura)
    values ('plave', 8);
    
    insert into punac (prviputa, svekar)
    values ('1998-02-15', 3);

    insert into punac (prviputa, svekar)
    values ('1975-03-16', 1);

    insert into punac (prviputa, svekar)
    values ('2002-08-26', 2);
    
    insert into punica (hlace, nausnica, vesta, modelnaocala, treciputa, punac)
    values ('bijele', 2, 'prugasta', 'mačkaste', '2022-02-14', 1);

    insert into punica (hlace, nausnica, vesta, modelnaocala, treciputa, punac)
    values ('crne', 6, 'lagana', 'okrugle', '2020-04-24', 2);

    insert into punica (hlace, nausnica, vesta, modelnaocala, treciputa, punac)
    values ('plave', 1, 'bijela', 'dioptrijske', '1999-07-31', 3);

    insert into cura (carape, maraka, vesta)
    values ('bijele', 14.4, 'zelena');

    insert into cura (carape, maraka, vesta)
    values ('crne', 5.9, 'plava');

    insert into cura (carape, maraka, vesta)
    values ('sive', 20, 'bijela');

    insert into svekar_cura (svekar, cura)
    values (1,1), (2,2), (3,3);

    update mladic set haljina='Osijek';

    delete from ostavljena where ogrlica=17;

    select majica from punac where prviputa is null;

    select a.asocijalno, b.stilfrizura, c.nausnica
    from cura a inner join svekar_cura sc on a.sifra=sc.cura 
    inner join svekar d on sc.svekar=d.sifra 
    inner join punac e on e.svekar=d.sifra 
    inner join punica c on c.punac=e.sifra 
    left join ostavljena b on b.punica=c.sifra
    where e.prviputa is not null and d.majica like '%ba%'
    order by c.nausnica desc;

    select a.majica, a.carape from svekar a 
    inner join svekar_cura b on b.svekar=a.sifra
    where b.sifra is null;