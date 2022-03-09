INSERT INTO bd_typ_klienta (opis_typu)
VALUES
(
    'INT'
);

INSERT INTO bd_typ_klienta (opis_typu)
VALUES
(
    'FIZ'
);

INSERT INTO bd_stanowisko (opis_stanowiska)
VALUES
(
    'SPRZEDAWCA'
);

INSERT INTO bd_stanowisko (opis_stanowiska)
VALUES
(
    'SERWISANT'
);

INSERT INTO bd_rodzaj_uslugi (opis_rodzaju)
VALUES
(
    'GWARANCJA'
);

INSERT INTO bd_rodzaj_uslugi (opis_rodzaju)
VALUES
(
    'NAPRAWA'
);

INSERT INTO bd_produkt (nazwa_produktu, cena_produktu, producent)
VALUES
(
    'Karta graficzna RTX 3090',
    5000,
    'Nvidia'
);

INSERT INTO bd_produkt (nazwa_produktu, cena_produktu, producent)
VALUES
(
    'Karta graficzna Radeon RX 580',
    4000,
    'AMD'
);

INSERT INTO bd_produkt (nazwa_produktu, cena_produktu, producent)
VALUES
(
    'Procesor i9-10980XE',
    3000,
    'Intel'
);

INSERT INTO bd_produkt (nazwa_produktu, cena_produktu, producent)
VALUES
(
    'Procesor Ryzen 5',
    2000,
    'AMD'
);

INSERT INTO bd_produkt (nazwa_produktu, cena_produktu, producent)
VALUES
(
    'Plyta glówna M5A97 R2.0',
    1000,
    'ASUS'
);

INSERT INTO bd_produkt (nazwa_produktu, cena_produktu, producent)
VALUES
(
    'Plyta glówna Z390 PRO4',
    500,
    'ASRock'
);

INSERT INTO bd_produkt (nazwa_produktu, cena_produktu, producent)
VALUES
(
    'Monitor XB2483HSU-B3',
    1000,
    'iiyama'
);

INSERT INTO bd_produkt (nazwa_produktu, cena_produktu, producent)
VALUES
(
    'Monitor TUF VG259Q',
    2000,
    'ASUS'
);

INSERT INTO bd_magazyn
VALUES
(
    1,
    2
);

INSERT INTO bd_magazyn
VALUES
(
    2,
    20
);

INSERT INTO bd_magazyn
VALUES
(
    3,
    1
);

INSERT INTO bd_magazyn
VALUES
(
    4,
    50
);

INSERT INTO bd_magazyn
VALUES
(
    5,
    1
);

INSERT INTO bd_magazyn
VALUES
(
    6,
    5
);

INSERT INTO bd_magazyn
VALUES
(
    7,
    10
);

INSERT INTO bd_magazyn
VALUES
(
    8,
    15
);

INSERT INTO bd_klient (imie, nazwisko, nr_typu)
VALUES
(
    'Michal',
    'Szczepaniak',
    1
);

INSERT INTO bd_klient (imie, nazwisko, nr_typu)
VALUES
(
    'Hieronim',
    'Stankiewicz',
    1
);

INSERT INTO bd_klient (imie, nazwisko, nr_typu)
VALUES
(
    'Ginter',
    'Œwi¹tek',
    1
);

INSERT INTO bd_klient (imie, nazwisko, nr_typu)
VALUES
(
    'Antonina',
    'Piotrowska',
    1
);

INSERT INTO bd_klient (imie, nazwisko, nr_typu)
VALUES
(
    'Nadia',
    'Nowicka',
    2
);

INSERT INTO bd_klient (imie, nazwisko, nr_typu)
VALUES
(
    'Maciej',
    'Nowak',
    2
);

INSERT INTO bd_klient (imie, nazwisko, nr_typu)
VALUES
(
    'Albin',
    'Matusiak',
    2
);

INSERT INTO bd_klient (imie, nazwisko, nr_typu)
VALUES
(
    'Judyta',
    'Adamska',
    2
);

INSERT INTO bd_pracownik (imie, nazwisko, nr_stanowiska)
VALUES
(
    'Damian',
    'Kasprzak',
    1
);

INSERT INTO bd_pracownik (imie, nazwisko, nr_stanowiska)
VALUES
(
    'Klara',
    'Adamska',
    2
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    1,
    1,
    1
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    1,
    3,
    1
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    2,
    2,
    2
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    2,
    4,
    1
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    3,
    5,
    1
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    4,
    1,
    1
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    5,
    8,
    2
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    5,
    2,
    2
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    6,
    7,
    2
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    7,
    8,
    1
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    8,
    2,
    1
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    8,
    4,
    1
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    8,
    6,
    1
);

INSERT INTO bd_zamowienie (nr_klienta, nr_produktu, liczba_sztuk)
VALUES
(
    8,
    7,
    1
);

INSERT INTO bd_usluga (nr_pracownika, nr_rodzaju)
VALUES
(
    1,
    1
);

INSERT INTO bd_usluga (nr_pracownika, nr_rodzaju)
VALUES
(
    2,
    2
);

INSERT INTO bd_historia_uslug
VALUES
(
    1,
    1,
    '2017-07-13'
);

INSERT INTO bd_historia_uslug
VALUES
(
    2,
    2,
    '2017-08-18'
);

INSERT INTO bd_historia_uslug
VALUES
(
    1,
    3,
    '2018-07-24'
);

INSERT INTO bd_historia_uslug
VALUES
(
    2,
    4,
    '2019-10-30'
);

INSERT INTO bd_historia_uslug
VALUES
(
    1,
    5,
    '2020-05-15'
);

INSERT INTO bd_historia_uslug
VALUES
(
    2,
    6,
    '2020-09-18'
);

INSERT INTO bd_historia_uslug
VALUES
(
    1,
    7,
    '2020-12-01'
);

INSERT INTO bd_historia_uslug
VALUES
(
    2,
    8,
    '2020-12-11'
);

COMMIT;