CREATE DATABASE wypozyczalniaFilmow;
CREATE TABLE IF NOT EXISTS gatunki
(
    id_gatunku int auto_increment,
    gatunek    varchar(50) not null,
    primary key (id_gatunku)
);

CREATE TABLE IF NOT EXISTS pracownicy
(
    id_pracownika int auto_increment,
    imie          varchar(30) not null,
    nazwisko      varchar(30) not null,
    adres_email   varchar(30) not null,
    telefon       varchar(10) not null,
    primary key (id_pracownika)
);

CREATE TABLE IF NOT EXISTS klienci
(
    id_klienta  int auto_increment,
    imie        varchar(30) not null,
    nazwisko    varchar(30) not null,
    telefon     varchar(10) not null,
    adres_email varchar(30) not null,
    primary key (id_klienta)
);

CREATE TABLE IF NOT EXISTS rezyserzy
(
    id_rezysera    int auto_increment,
    imie           varchar(30) not null,
    nazwisko       varchar(30) not null,
    data_urodzenia date        not null,
    primary key (id_rezysera)
);

CREATE TABLE IF NOT EXISTS dostepne_tytuly
(
    id_tytulu     int auto_increment,
    tytul         varchar(50) not null,
    rok_produkcji year        not null,
    id_gatunku    int references gatunki (id_gatunku),
    czas_minuty   int(3)      not null,
    primary key (id_tytulu)
);

CREATE TABLE IF NOT EXISTS egzemplarze
(
    id_egzemplarza int auto_increment,
    id_tytulu      int references dostepne_tytuly (id_tytulu),
    primary key (id_egzemplarza)
);

CREATE TABLE IF NOT EXISTS wypozyczenia
(
    id_wypozyczenia   int auto_increment,
    id_egzemplarza    int references egzemplarze (id_egzemplarza),
    id_klienta        int references klienci (id_klienta),
    data_wypozyczenia date not null,
    do_kiedy          date not null,
    id_pracownika     int references pracownicy (id_pracownika),
    primary key (id_wypozyczenia)
);

CREATE TABLE IF NOT EXISTS zwroty
(
    id_zwrotu       int auto_increment,
    id_wypozyczenia int references wypozyczenia (id_wypozyczenia),
    data_zwrotu     date not null,
    id_pracownika   int references pracownicy (id_pracownika),
    primary key (id_zwrotu)
);

CREATE TABLE IF NOT EXISTS rezyseria
(
    id_tytulu   int references dostepne_tytuly (id_tytulu),
    id_rezysera int references rezyserzy (id_rezysera)
);


