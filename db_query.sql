@D:\bd\projekt_create.sql
@D:\bd\projekt_drop.sql
@D:\bd\projekt_populate.sql

select  "Klient", "Data zg³oszenia", "Przyj¹l zg³oszenie"
from    bd_historia_napraw
where   "Klient" like '%a';

select * from bd_zamowienia_ogolne
where "Klient" in
(
    select  imie || ' ' || nazwisko
    from    bd_klient k
            join bd_zamowienie z on k.nr_klienta = z.nr_klienta
            join bd_produkt p on z.nr_produktu = p.nr_produktu
    having  sum(cena_produktu) > 4000
    group by imie || ' ' || nazwisko
);

select  rownum as "L. p.",
        "Klient generujacy najwiêkszy dochód",
        "Wydal",
        "Kupil sztuk"
from
(
    select  imie || ' ' || nazwisko as "Klient generujacy najwiêkszy dochód", 
            sum(cena_produktu) || ' z³' as "Wydal", 
            sum(liczba_sztuk) || ' szt.' as "Kupil sztuk"
    from    bd_klient k
            join bd_typ_klienta t on k.nr_typu = t.nr_typu
            join bd_zamowienie z on k.nr_klienta = z.nr_klienta
            join bd_produkt p on z.nr_produktu = p.nr_produktu
    group by imie || ' ' || nazwisko
    order by sum(cena_produktu) desc
)
where   rownum = 1;

begin
    dbms_output.put_line('Przychod z roku 2021 to ' || fn_zwroc_przychod(2021) || '.');
end;
/

begin
    dbms_output.put_line('Napraw w roku 2021 bylo ' || fn_zwroc_liczbe_napraw(2020) || '.');
end;
/

begin
    if fn_czy_klient_gwarancja(1)
    then
        dbms_output.put_line('Klient oddawal produkt na gwarancje.');
    else
        dbms_output.put_line('Klient nie oddawal produktu na gwarancje.');
    end if;
end;
/

begin
    pr_insert_klient('Jan', 'Abacki', 2);
    pr_insert_klient('Jan', 'Abacki', 2);
end;
/

begin
    pr_update_magazyn(5, 2);
    pr_update_magazyn(9, 2);
end;
/

begin
    pr_delete_magazyn(5);
    pr_delete_magazyn(5);
end;
/