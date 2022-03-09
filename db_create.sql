CREATE SEQUENCE seq_klient START WITH 1 INCREMENT BY 1 MAXVALUE 100 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_pracownik START WITH 1 INCREMENT BY 1 MAXVALUE 10 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_produkt START WITH 1 INCREMENT BY 1 MAXVALUE 100 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_rodzaj_uslugi START WITH 1 INCREMENT BY 1 MAXVALUE 2 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_stanowisko START WITH 1 INCREMENT BY 1 MAXVALUE 2 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_typ_klienta START WITH 1 INCREMENT BY 1 MAXVALUE 2 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_usluga START WITH 1 INCREMENT BY 1 MAXVALUE 2 MINVALUE 1 NOCACHE;

CREATE TABLE bd_historia_uslug (
    nr_uslugi        NUMBER(1) NOT NULL,
    nr_klienta       NUMBER(3) NOT NULL,
    data_zgloszenia  DATE NOT NULL
);

ALTER TABLE bd_historia_uslug ADD CONSTRAINT bd_historia_uslug_pk PRIMARY KEY ( nr_uslugi,
                                                                                nr_klienta );

CREATE TABLE bd_klient (
    nr_klienta  NUMBER(3) NOT NULL,
    imie        VARCHAR2(15) NOT NULL,
    nazwisko    VARCHAR2(20) NOT NULL,
    nr_typu     NUMBER(1) NOT NULL
);

ALTER TABLE bd_klient ADD CONSTRAINT bd_klient_pk PRIMARY KEY ( nr_klienta );

CREATE TABLE bd_magazyn (
    nr_produktu   NUMBER(3) NOT NULL,
    liczba_sztuk  NUMBER(5) NOT NULL
);

ALTER TABLE bd_magazyn ADD CONSTRAINT bd_magazyn_pk PRIMARY KEY ( nr_produktu );

CREATE TABLE bd_pracownik (
    nr_pracownika  NUMBER(2) NOT NULL,
    imie           VARCHAR2(15) NOT NULL,
    nazwisko       VARCHAR2(20) NOT NULL,
    nr_stanowiska  NUMBER(1) NOT NULL
);

ALTER TABLE bd_pracownik ADD CONSTRAINT bd_pracownik_pk PRIMARY KEY ( nr_pracownika );

CREATE TABLE bd_produkt (
    nr_produktu     NUMBER(3) NOT NULL,
    nazwa_produktu  VARCHAR2(30) NOT NULL,
    cena_produktu   NUMBER(5) NOT NULL,
    producent       VARCHAR2(20)
);

ALTER TABLE bd_produkt ADD CONSTRAINT bd_produkt_pk PRIMARY KEY ( nr_produktu );

CREATE TABLE bd_rodzaj_uslugi (
    nr_rodzaju    NUMBER(1) NOT NULL,
    opis_rodzaju  VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN bd_rodzaj_uslugi.opis_rodzaju IS
    'Mo¿liwe typy:
- ZWROT
- GWARANCJA
- NAPRAWA';

ALTER TABLE bd_rodzaj_uslugi ADD CONSTRAINT bd_rodzaj_uslugi_pk PRIMARY KEY ( nr_rodzaju );

CREATE TABLE bd_stanowisko (
    nr_stanowiska    NUMBER(1) NOT NULL,
    opis_stanowiska  VARCHAR2(20)
);

COMMENT ON COLUMN bd_stanowisko.opis_stanowiska IS
    'Dostêpne stanowiska:
SPRZEDAWCA
SERWISANT';

ALTER TABLE bd_stanowisko ADD CONSTRAINT bd_stanowisko_pk PRIMARY KEY ( nr_stanowiska );

CREATE TABLE bd_typ_klienta (
    nr_typu    NUMBER(1) NOT NULL,
    opis_typu  VARCHAR2(3) NOT NULL
);

COMMENT ON COLUMN bd_typ_klienta.opis_typu IS
    'INT - internetowy
FIZ - fizyczny';

ALTER TABLE bd_typ_klienta ADD CONSTRAINT bd_typ_klienta_pk PRIMARY KEY ( nr_typu );

CREATE TABLE bd_usluga (
    nr_uslugi      NUMBER(1) NOT NULL,
    nr_pracownika  NUMBER(2) NOT NULL,
    nr_rodzaju     NUMBER(1) NOT NULL
);

ALTER TABLE bd_usluga ADD CONSTRAINT bd_usluga_pk PRIMARY KEY ( nr_uslugi );

CREATE TABLE bd_zamowienie (
    nr_klienta       NUMBER(3) NOT NULL,
    nr_produktu      NUMBER(3) NOT NULL,
    data_zamowienia  DATE NOT NULL,
    liczba_sztuk     NUMBER(3) NOT NULL
);

ALTER TABLE bd_zamowienie ADD CONSTRAINT bd_zamowienie_pk PRIMARY KEY ( nr_klienta,
                                                                        nr_produktu );

ALTER TABLE bd_historia_uslug
    ADD CONSTRAINT bd_klient_fk FOREIGN KEY ( nr_klienta )
        REFERENCES bd_klient ( nr_klienta )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE bd_zamowienie
    ADD CONSTRAINT bd_klient_fkv1 FOREIGN KEY ( nr_klienta )
        REFERENCES bd_klient ( nr_klienta )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE bd_usluga
    ADD CONSTRAINT bd_pracownik_fk FOREIGN KEY ( nr_pracownika )
        REFERENCES bd_pracownik ( nr_pracownika )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE bd_zamowienie
    ADD CONSTRAINT bd_produkt_fk FOREIGN KEY ( nr_produktu )
        REFERENCES bd_produkt ( nr_produktu )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE bd_magazyn
    ADD CONSTRAINT bd_produkt_fkv2 FOREIGN KEY ( nr_produktu )
        REFERENCES bd_produkt ( nr_produktu )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE bd_usluga
    ADD CONSTRAINT bd_rodzaj_uslugi_fk FOREIGN KEY ( nr_rodzaju )
        REFERENCES bd_rodzaj_uslugi ( nr_rodzaju )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE bd_pracownik
    ADD CONSTRAINT bd_stanowisko_fk FOREIGN KEY ( nr_stanowiska )
        REFERENCES bd_stanowisko ( nr_stanowiska )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE bd_klient
    ADD CONSTRAINT bd_typ_klienta_fk FOREIGN KEY ( nr_typu )
        REFERENCES bd_typ_klienta ( nr_typu )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE bd_historia_uslug
    ADD CONSTRAINT bd_usluga_fk FOREIGN KEY ( nr_uslugi )
        REFERENCES bd_usluga ( nr_uslugi )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE bd_typ_klienta
MODIFY nr_typu DEFAULT seq_typ_klienta.NEXTVAL;

ALTER TABLE bd_stanowisko
MODIFY nr_stanowiska DEFAULT seq_stanowisko.NEXTVAL;

ALTER TABLE bd_rodzaj_uslugi
MODIFY nr_rodzaju DEFAULT seq_rodzaj_uslugi.NEXTVAL;

ALTER TABLE bd_typ_klienta
ADD CONSTRAINT ch_typ CHECK (opis_typu IN ('INT', 'FIZ'));

ALTER TABLE bd_stanowisko
ADD CONSTRAINT ch_stanowisko CHECK (opis_stanowiska IN ('SPRZEDAWCA', 'SERWISANT'));

ALTER TABLE bd_rodzaj_uslugi
ADD CONSTRAINT ch_rodzaj CHECK (opis_rodzaju IN ('GWARANCJA', 'NAPRAWA'));

ALTER TABLE bd_zamowienie
ADD CONSTRAINT ch_liczba_sztuk_zamowienie CHECK (liczba_sztuk > 0);

ALTER TABLE bd_magazyn
ADD CONSTRAINT ch_liczba_sztuk_magazyn CHECK (liczba_sztuk >= 0);

ALTER TABLE bd_produkt
ADD CONSTRAINT ch_cena CHECK (cena_produktu > 0);

CREATE OR REPLACE TRIGGER tr_ins_klient 
    BEFORE INSERT ON bd_klient 
    FOR EACH ROW 
begin
	:new.nr_klienta := seq_klient.nextval;
end; 
/

CREATE OR REPLACE TRIGGER tr_ins_pracownik 
    BEFORE INSERT ON bd_pracownik 
    FOR EACH ROW 
begin
	:new.nr_pracownika := seq_pracownik.nextval;
end; 
/

CREATE OR REPLACE TRIGGER tr_ins_produkt 
    BEFORE INSERT ON bd_produkt 
    FOR EACH ROW 
begin
	:new.nr_produktu := seq_produkt.nextval;
end; 
/

CREATE OR REPLACE TRIGGER tr_ins_usluga 
    BEFORE INSERT ON bd_usluga 
    FOR EACH ROW 
begin
	:new.nr_uslugi := seq_usluga.nextval;
end; 
/

CREATE OR REPLACE TRIGGER tr_ins_zamowienie 
    BEFORE INSERT ON bd_zamowienie 
    FOR EACH ROW 
begin
	:new.data_zamowienia := sysdate;

	update bd_magazyn
	set liczba_sztuk = liczba_sztuk - :new.liczba_sztuk
	where nr_produktu = :new.nr_produktu;
end; 
/

CREATE OR REPLACE VIEW bd_zamowienia_internet ("klient", "wydano", "zakupiono sztuk") AS
SELECT  imie || ' ' || nazwisko, 
        SUM(cena_produktu) || ' z³',
        SUM(liczba_sztuk) || ' szt.'
FROM    bd_klient K
        JOIN bd_typ_klienta T ON K.nr_typu = T.nr_typu
        JOIN bd_zamowienie z ON K.nr_klienta = z.nr_klienta
        JOIN bd_produkt P ON z.nr_produktu = P.nr_produktu
WHERE   opis_typu = 'INT'
GROUP BY imie || ' ' || nazwisko
ORDER BY SUM(cena_produktu) DESC;

CREATE OR REPLACE VIEW bd_zamowienia_fizycznie ("klient", "wydano", "zakupiono sztuk") AS
SELECT  imie || ' ' || nazwisko, 
        SUM(cena_produktu) || ' z³', 
        SUM(liczba_sztuk) || ' szt.'
FROM    bd_klient K
        JOIN bd_typ_klienta T ON K.nr_typu = T.nr_typu
        JOIN bd_zamowienie z ON K.nr_klienta = z.nr_klienta
        JOIN bd_produkt P ON z.nr_produktu = P.nr_produktu
WHERE   opis_typu = 'FIZ'
GROUP BY imie || ' ' || nazwisko
ORDER BY SUM(cena_produktu) DESC;

CREATE OR REPLACE VIEW bd_zamowienia_ogolne ("klient", "wydano", "zakupiono sztuk") AS
SELECT  imie || ' ' || nazwisko, 
        SUM(cena_produktu) || ' z³', 
        SUM(liczba_sztuk) || ' szt.'
FROM    bd_klient K
        JOIN bd_typ_klienta T ON K.nr_typu = T.nr_typu
        JOIN bd_zamowienie z ON K.nr_klienta = z.nr_klienta
        JOIN bd_produkt P ON z.nr_produktu = P.nr_produktu
GROUP BY imie || ' ' || nazwisko
ORDER BY SUM(cena_produktu) DESC;

CREATE OR REPLACE VIEW bd_sprzedaz_monitorow ("producent", "liczba sprzedanych sztuk", "zysk") AS
SELECT  producent,
        SUM(liczba_sztuk) || ' szt.',
        SUM(cena_produktu) * SUM(liczba_sztuk) || ' z³'
FROM    bd_klient K
        JOIN bd_zamowienie z ON K.nr_klienta = z.nr_klienta
        JOIN bd_produkt P ON z.nr_produktu = P.nr_produktu
WHERE   nazwa_produktu LIKE 'Monitor%'
GROUP BY producent
ORDER BY SUM(cena_produktu) DESC;

CREATE OR REPLACE VIEW bd_sprzedaz_procesorow ("producent", "liczba sprzedanych sztuk", "zysk") AS
SELECT  producent,
        SUM(liczba_sztuk) || ' szt.',
        SUM(cena_produktu) * SUM(liczba_sztuk) || ' z³'
FROM    bd_klient K
        JOIN bd_zamowienie z ON K.nr_klienta = z.nr_klienta
        JOIN bd_produkt P ON z.nr_produktu = P.nr_produktu
WHERE   nazwa_produktu LIKE 'Procesor%'
GROUP BY producent
ORDER BY SUM(cena_produktu) DESC;

CREATE OR REPLACE VIEW bd_historia_napraw ("klient", "data zg³oszenia", "przyj¹l zg³oszenie") AS
SELECT  K.imie ||' ' || K.nazwisko,
        data_zgloszenia,
        P.imie || ' ' || P.nazwisko
FROM    bd_klient K
        JOIN bd_historia_uslug H ON K.nr_klienta = H.nr_klienta
        JOIN bd_usluga u ON H.nr_uslugi = u.nr_uslugi
        JOIN bd_rodzaj_uslugi R ON u.nr_rodzaju = R.nr_rodzaju
        JOIN bd_pracownik P ON u.nr_pracownika = P.nr_pracownika
WHERE   opis_rodzaju = 'NAPRAWA'
ORDER BY data_zgloszenia DESC;

CREATE OR REPLACE FUNCTION fn_zwroc_przychod(v_rok INTEGER) RETURN INTEGER AS
czyistnieje BOOLEAN := FALSE;
przychodzaprodukt INTEGER;
calkowityprzychod INTEGER := 0;
BEGIN
    FOR v_data IN
    (
        SELECT data_zamowienia FROM bd_zamowienie
    )
    LOOP
        IF v_rok = (EXTRACT (YEAR FROM v_data.data_zamowienia))
        THEN
            czyistnieje := TRUE;
        END IF;
    END LOOP;
    
    IF czyistnieje = FALSE
    THEN
        RETURN -1;
    END IF;
    
    FOR v_zamowienie IN
    (
        SELECT  P.nr_produktu, liczba_sztuk
        FROM    bd_produkt P
                JOIN bd_zamowienie z ON P.nr_produktu = z.nr_produktu
        WHERE   EXTRACT (YEAR FROM data_zamowienia) = v_rok
    )
    LOOP
        SELECT  (cena_produktu * v_zamowienie.liczba_sztuk) INTO przychodzaprodukt
        FROM    bd_produkt
        WHERE   nr_produktu = v_zamowienie.nr_produktu;
        
        calkowityprzychod := calkowityprzychod + przychodzaprodukt;
    END LOOP;
    
    RETURN calkowityprzychod;
    
END fn_zwroc_przychod;
/

CREATE OR REPLACE FUNCTION fn_zwroc_liczbe_napraw(v_rok INTEGER) RETURN INTEGER AS
czyistnieje BOOLEAN := FALSE;
liczbanapraw INTEGER;
BEGIN
    FOR v_data IN
    (
        SELECT data_zgloszenia FROM bd_historia_uslug
    )
    LOOP
        IF v_rok = (EXTRACT (YEAR FROM v_data.data_zgloszenia))
        THEN
            czyistnieje := TRUE;
        END IF;
    END LOOP;
    
    IF czyistnieje = FALSE
    THEN
        RETURN -1;
    END IF;
    
    SELECT  COUNT(*) INTO liczbanapraw
    FROM    bd_historia_uslug H
            JOIN bd_usluga u ON H.nr_uslugi = u.nr_uslugi
            JOIN bd_rodzaj_uslugi R ON u.nr_rodzaju = R.nr_rodzaju
    WHERE   EXTRACT (YEAR FROM data_zgloszenia) = v_rok AND
            opis_rodzaju = 'NAPRAWA';

    RETURN liczbanapraw;
    
END fn_zwroc_liczbe_napraw;
/

CREATE OR REPLACE FUNCTION fn_czy_klient_gwarancja(v_nr_klienta bd_klient.nr_klienta%TYPE) RETURN BOOLEAN AS
czyistnieje BOOLEAN := FALSE;
czyoddawalnagwarancje BOOLEAN := FALSE;
liczbagwarancji INTEGER;
BEGIN
    FOR v_klient IN
    (
        SELECT nr_klienta FROM bd_klient
    )
    LOOP
        IF v_nr_klienta = v_klient.nr_klienta
        THEN
            czyistnieje := TRUE;
        END IF;
    END LOOP;
    
    IF czyistnieje = FALSE
    THEN
        RETURN FALSE;
    END IF;
    
    SELECT  COUNT(*) INTO liczbagwarancji
    FROM    bd_klient K
            JOIN bd_historia_uslug H ON K.nr_klienta = H.nr_klienta
            JOIN bd_usluga u ON H.nr_uslugi = u.nr_uslugi
            JOIN bd_rodzaj_uslugi R ON u.nr_rodzaju = R.nr_rodzaju
    WHERE   H.nr_klienta = v_nr_klienta AND
            opis_rodzaju = 'GWARANCJA';
            
    IF liczbagwarancji > 0
    THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
    
END fn_czy_klient_gwarancja;
/

CREATE OR REPLACE PROCEDURE pr_insert_klient(v_imie bd_klient.imie%TYPE, v_nazwisko bd_klient.nazwisko%TYPE, v_typ bd_klient.nr_typu%TYPE) AS
czyistnieje BOOLEAN := FALSE;
BEGIN
    FOR v_klient IN
    (
        SELECT imie, nazwisko FROM bd_klient
    )
    LOOP
        IF v_klient.imie = v_imie AND v_klient.nazwisko = v_nazwisko
        THEN
            czyistnieje := TRUE;
            EXIT;
        END IF;
    END LOOP;
    
    IF czyistnieje = TRUE
    THEN
        dbms_output.put_line('Taki klient ju¿ jest w bazie!');
    ELSE
        INSERT INTO bd_klient (imie, nazwisko, nr_typu)
        VALUES
        (
            v_imie,
            v_nazwisko,
            v_typ
        );
        
        dbms_output.put_line('Pomyœlnie dodano klienta do bazy!');
    
        COMMIT;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE pr_update_magazyn(v_nr_produktu bd_magazyn.nr_produktu%TYPE, v_liczba_sztuk bd_magazyn.liczba_sztuk%TYPE) AS
czyistnieje BOOLEAN := FALSE;
BEGIN
    IF v_liczba_sztuk <= 0
    THEN
        dbms_output.put_line('Niepoprawna liczba sztuk!');
    ELSE
        FOR v_produkt IN
        ( 
            SELECT nr_produktu FROM bd_magazyn
        )
        LOOP
            IF v_nr_produktu = v_produkt.nr_produktu
            THEN
                czyistnieje := TRUE;
            END IF;
        END LOOP;
        
        IF czyistnieje = FALSE
        THEN
            dbms_output.put_line('Nie ma takiego produktu w magazynie!');
        ELSE
            UPDATE bd_magazyn
            SET liczba_sztuk = liczba_sztuk + v_liczba_sztuk
            WHERE nr_produktu = v_nr_produktu;
            
            dbms_output.put_line('Pomyslnie dokonano dostawy!');
        END IF;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE pr_delete_magazyn(v_nr_produktu bd_magazyn.nr_produktu%TYPE) AS
czyistnieje BOOLEAN := FALSE;
BEGIN
    FOR v_produkt IN
    ( 
        SELECT  M.nr_produktu mnr,
                P.nr_produktu pnr
        FROM    bd_magazyn M
                JOIN bd_produkt P ON M.nr_produktu = P.nr_produktu
    )
    LOOP
        IF v_nr_produktu = v_produkt.mnr AND v_nr_produktu = v_produkt.pnr
        THEN
            czyistnieje := TRUE;
        END IF;
    END LOOP;
    
    IF czyistnieje = FALSE
    THEN
        dbms_output.put_line('Nie ma takiego produktu w magazynie ani w bazie produktów!');
    ELSE
        DELETE bd_magazyn
        WHERE nr_produktu = v_nr_produktu;
        
        DELETE bd_produkt
        WHERE nr_produktu = v_nr_produktu;
        
        dbms_output.put_line('Pomyœlnie usuniêto produkt z magazynu oraz bazy produktów!');
    END IF;
END;
/