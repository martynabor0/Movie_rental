/* punkt13 : kwerenda wyszukująca klientów którzy w podanym okresie czasu wypożyczyli film oraz tytuł tego filmu*/

SELECT dostepne_tytuly.tytul, wypozyczenia.data_wypozyczenia, klienci.imie, klienci.nazwisko
FROM wypozyczenia
         INNER JOIN klienci on wypozyczenia.id_klienta = klienci.id_klienta
         INNER JOIN egzemplarze on wypozyczenia.id_egzemplarza = egzemplarze.id_egzemplarza
         INNER JOIN dostepne_tytuly on dostepne_tytuly.id_tytulu = egzemplarze.id_tytulu
WHERE data_wypozyczenia BETWEEN '2022-06-05' AND '2022-06-21';

/*punkt14 :  kwerenda zliczająca ilość filmów w danym gatunku w tym z jakiego gatunku nie ma żadnego filmu*/

SELECT gatunki.gatunek, COUNT(dostepne_tytuly.id_gatunku) as 'ilość_filmów'
FROM gatunki
         LEFT JOIN dostepne_tytuly on gatunki.id_gatunku = dostepne_tytuly.id_gatunku
GROUP BY gatunki.gatunek
ORDER BY ilość_filmów;

/* punkt15 : kwerenda wyszukująca klientów mających wiecej niz jedno wypozyczenie*/
SELECT klienci.imie, klienci.nazwisko, COUNT(wypozyczenia.id_wypozyczenia) AS 'ilość_wypożyczeń'
FROM klienci
         RIGHT JOIN wypozyczenia ON klienci.id_klienta = wypozyczenia.id_klienta
GROUP BY klienci.id_klienta
HAVING ilość_wypożyczeń>1
ORDER BY ilość_wypożyczeń DESC;
