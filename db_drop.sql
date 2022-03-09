DROP TABLE bd_historia_uslug CASCADE CONSTRAINTS;

DROP TABLE bd_klient CASCADE CONSTRAINTS;

DROP TABLE bd_magazyn CASCADE CONSTRAINTS;

DROP TABLE bd_pracownik CASCADE CONSTRAINTS;

DROP TABLE bd_produkt CASCADE CONSTRAINTS;

DROP TABLE bd_rodzaj_uslugi CASCADE CONSTRAINTS;

DROP TABLE bd_stanowisko CASCADE CONSTRAINTS;

DROP TABLE bd_typ_klienta CASCADE CONSTRAINTS;

DROP TABLE bd_usluga CASCADE CONSTRAINTS;

DROP TABLE bd_zamowienie CASCADE CONSTRAINTS;

DROP SEQUENCE seq_klient;

DROP SEQUENCE seq_pracownik;

DROP SEQUENCE seq_produkt;

DROP SEQUENCE seq_rodzaj_uslugi;

DROP SEQUENCE seq_stanowisko;

DROP SEQUENCE seq_typ_klienta;

DROP SEQUENCE seq_usluga;

DROP VIEW bd_zamowienia_internet;

DROP VIEW bd_zamowienia_fizycznie;

DROP VIEW bd_zamowienia_ogolne;

DROP VIEW bd_sprzedaz_monitorow;

DROP VIEW bd_sprzedaz_procesorow;

DROP VIEW bd_historia_napraw;

DROP FUNCTION fn_zwroc_przychod;

DROP FUNCTION fn_zwroc_liczbe_napraw;

DROP FUNCTION fn_czy_klient_gwarancja;

DROP PROCEDURE pr_insert_klient;

DROP PROCEDURE pr_update_magazyn;

DROP PROCEDURE pr_delete_magazyn;