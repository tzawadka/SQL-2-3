--Tworzenie tabeli

CREATE TABLE PracownicyProjekty (
    PracownikID INT PRIMARY KEY,
    Imie VARCHAR(50),
    Nazwisko VARCHAR(50),
    Dzial VARCHAR(50),
    Stanowisko VARCHAR(50),
    Projekt VARCHAR(100),
    DataPrzydzialu DATE,
    CzasPracy INT, -- liczba godzin przepracowanych nad projektem
    Wynagrodzenie DECIMAL(10, 2),
    Premia DECIMAL(10, 2)
);


--Wypełnienie tabeli przykładowymi danymi

INSERT INTO PracownicyProjekty (PracownikID, Imie, Nazwisko, Dzial, Stanowisko, Projekt, DataPrzydzialu, CzasPracy, Wynagrodzenie, Premia) VALUES
(1, 'Adam', 'Kowalski', 'IT', 'Developer', 'Projekt A', '2024-01-10', 120, 6000.00, 500.00),
(2, 'Beata', 'Nowak', 'HR', 'Manager', 'Projekt B', '2024-02-01', 80, 7000.00, 800.00),
-- pozostałe 98 wierszy
(100, 'Zofia', 'Maj', 'Finanse', 'Analyst', 'Projekt J', '2024-07-22', 95, 5200.00, 600.00);


--Zapytania SQL

SELECT * FROM PracownicyProjekty WHERE Dzial = 'IT';

SELECT Imie, Nazwisko, Projekt FROM PracownicyProjekty;

SELECT DISTINCT Stanowisko FROM PracownicyProjekty;

SELECT * FROM PracownicyProjekty WHERE Projekt = 'Projekt A';

SELECT Imie, Nazwisko, Dzial FROM PracownicyProjekty WHERE CzasPracy > 100;

SELECT * FROM PracownicyProjekty WHERE Premia > 600;

SELECT * FROM PracownicyProjekty WHERE Dzial = 'HR' AND CzasPracy < 80;

SELECT * FROM PracownicyProjekty WHERE Stanowisko = 'Manager';

SELECT * FROM PracownicyProjekty WHERE DataPrzydzialu < '2024-03-01';

SELECT * FROM PracownicyProjekty WHERE Dzial IN ('IT', 'Finanse');

SELECT Dzial, SUM(CzasPracy) AS SumaGodzin FROM PracownicyProjekty GROUP BY Dzial;

SELECT Stanowisko, AVG(Wynagrodzenie) AS SrednieWynagrodzenie FROM PracownicyProjekty GROUP BY Stanowisko;

SELECT Dzial, COUNT(*) AS LiczbaPracownikow FROM PracownicyProjekty GROUP BY Dzial;

SELECT Dzial, MAX(Premia) AS MaksPremia FROM PracownicyProjekty GROUP BY Dzial;

SELECT Projekt, AVG(CzasPracy) AS SredniaLiczbaGodzin FROM PracownicyProjekty GROUP BY Projekt;

SELECT DISTINCT Dzial FROM PracownicyProjekty;

SELECT DISTINCT Projekt FROM PracownicyProjekty;

SELECT DISTINCT Stanowisko FROM PracownicyProjekty;

SELECT DISTINCT Imie FROM PracownicyProjekty;

SELECT DISTINCT Dzial, Stanowisko FROM PracownicyProjekty;

SELECT MIN(Wynagrodzenie) AS NajmniejszeWynagrodzenie FROM PracownicyProjekty;

SELECT MAX(CzasPracy) AS NajwiecejGodzin FROM PracownicyProjekty;

SELECT MIN(Premia) AS NajmniejszaPremia FROM PracownicyProjekty WHERE Dzial = 'IT';

SELECT MAX(Premia) AS NajwiekszaPremia FROM PracownicyProjekty WHERE Projekt = 'Projekt B';

SELECT MIN(CzasPracy) AS NajmniejGodzin FROM PracownicyProjekty WHERE Projekt = 'Projekt A';

SELECT SUM(Wynagrodzenie) AS SumaWynagrodzen FROM PracownicyProjekty;

SELECT AVG(Premia) AS SredniaPremia FROM PracownicyProjekty;

SELECT AVG(Wynagrodzenie) AS SrednieWynagrodzenieIT FROM PracownicyProjekty WHERE Dzial = 'IT';

SELECT SUM(CzasPracy) AS SumaGodzinProjektC FROM PracownicyProjekty WHERE Projekt = 'Projekt C';

SELECT AVG(CzasPracy) AS SredniaGodzinDeveloper FROM PracownicyProjekty WHERE Stanowisko = 'Developer';

SELECT Dzial, AVG(Wynagrodzenie) AS SrednieWynagrodzenie 
FROM PracownicyProjekty 
GROUP BY Dzial 
HAVING AVG(Wynagrodzenie) > 6000;

SELECT Projekt, SUM(CzasPracy) AS SumaGodzin 
FROM PracownicyProjekty 
GROUP BY Projekt 
HAVING SUM(CzasPracy) > 200;

SELECT Stanowisko, AVG(Premia) AS SredniaPremia 
FROM PracownicyProjekty 
GROUP BY Stanowisko 
HAVING AVG(Premia) > 700;

SELECT Dzial, COUNT(*) AS LiczbaPracownikow 
FROM PracownicyProjekty 
GROUP BY Dzial 
HAVING COUNT(*) > 10;

SELECT Projekt, MAX(Premia) AS MaksymalnaPremia 
FROM PracownicyProjekty 
GROUP BY Projekt 
HAVING MAX(Premia) > 800;

SELECT * FROM PracownicyProjekty ORDER BY Nazwisko;SELECT * FROM PracownicyProjekty ORDER BY Wynagrodzenie DESC;

SELECT * FROM PracownicyProjekty ORDER BY DataPrzydzialu;SELECT * FROM PracownicyProjekty ORDER BY CzasPracy DESC, Nazwisko;

SELECT Dzial, SUM(Wynagrodzenie) AS SumaWynagrodzen 
FROM PracownicyProjekty 
GROUP BY Dzial 
ORDER BY SumaWynagrodzen DESC;

SELECT * FROM PracownicyProjekty LIMIT 10;

SELECT * FROM PracownicyProjekty ORDER BY Wynagrodzenie DESC LIMIT 5;

SELECT Projekt, SUM(CzasPracy) AS SumaGodzin 
FROM PracownicyProjekty 
GROUP BY Projekt 
ORDER BY SumaGodzin ASC 
LIMIT 3;

SELECT * FROM PracownicyProjekty ORDER BY DataPrzydzialu ASC LIMIT 2;

SELECT DISTINCT Stanowisko FROM PracownicyProjekty LIMIT 10;


--Tworzenie dodatkowej tabeli

CREATE TABLE ProjektyDetale (
    ProjektID INT PRIMARY KEY,
    NazwaProjektu VARCHAR(100),
    KierownikProjektu VARCHAR(100),
    Budzet DECIMAL(15, 2),
    DataRozpoczecia DATE,
    DataZakonczenia DATE,
    Status VARCHAR(50),
    LiczbaPracownikow INT,
    Klient VARCHAR(100),
    Technologia VARCHAR(50)
);


--Wypełnienie tabeli przykładowymi danymi

INSERT INTO ProjektyDetale (ProjektID, NazwaProjektu, KierownikProjektu, Budzet, DataRozpoczecia, DataZakonczenia, Status, LiczbaPracownikow, Klient, Technologia) VALUES
(1, 'Projekt A', 'Jan Kowalski', 500000.00, '2024-01-10', '2024-12-31', 'W trakcie', 10, 'Firma A', 'Java'),
(2, 'Projekt B', 'Anna Nowak', 300000.00, '2024-02-15', '2024-11-30', 'W trakcie', 8, 'Firma B', 'Python'),
-- pozostałe 98 wierszy 
(100, 'Projekt J', 'Piotr Wiśniewski', 400000.00, '2024-03-01', '2024-09-30', 'Zakończony', 5, 'Firma J', 'C#');


--Zapytania SQL
SELECT pp.Imie, pp.Nazwisko, pd.NazwaProjektu 
FROM PracownicyProjekty pp
INNER JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pd.NazwaProjektu, pp.CzasPracy 
FROM ProjektyDetale pd
LEFT JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT pd.NazwaProjektu, pp.Imie, pp.Nazwisko 
FROM ProjektyDetale pd
RIGHT JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT pp.Imie, pp.Nazwisko, pd.NazwaProjektu 
FROM PracownicyProjekty pp
CROSS JOIN ProjektyDetale pd;

SELECT * 
FROM PracownicyProjekty pp 
NATURAL JOIN ProjektyDetale pd;

SELECT Imie, Nazwisko FROM PracownicyProjekty WHERE Dzial = 'IT'
UNION
SELECT Imie, Nazwisko FROM PracownicyProjekty WHERE Dzial = 'HR';

SELECT Imie, Nazwisko FROM PracownicyProjekty WHERE Dzial = 'IT'
UNION ALL
SELECT Imie, Nazwisko FROM PracownicyProjekty WHERE Dzial = 'HR';

UPDATE PracownicyProjekty
SET Premia = Premia + 200
WHERE Dzial = 'IT';

UPDATE ProjektyDetale
SET Status = 'Zakończony'
WHERE DataZakonczenia < CURRENT_DATE;

DELETE FROM PracownicyProjekty WHERE CzasPracy < 50;

DELETE FROM ProjektyDetale WHERE Budzet < 100000;

DROP TABLE ProjektyDetale;

TRUNCATE TABLE PracownicyProjekty;

ALTER TABLE PracownicyProjekty
ADD Email VARCHAR(100);

ALTER TABLE PracownicyProjekty
RENAME COLUMN Stanowisko TO Rola;

CREATE VIEW WidokProjektyPracownicy AS
SELECT pp.Imie, pp.Nazwisko, pp.Dzial, pd.NazwaProjektu, pd.Budzet
FROM PracownicyProjekty pp
JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;
SELECT * FROM WidokProjektyPracownicy;

CREATE INDEX idx_nazwisko ON PracownicyProjekty(Nazwisko);

CREATE INDEX idx_dzial_stanowisko ON PracownicyProjekty(Dzial, Stanowisko);

SELECT * FROM PracownicyProjekty WHERE Nazwisko LIKE 'K%';

SELECT * FROM ProjektyDetale WHERE NazwaProjektu LIKE '%Projekt%';

SELECT Imie, Nazwisko, Wynagrodzenie,
CASE 
    WHEN Wynagrodzenie > 7000 THEN 'Wysokie'
    WHEN Wynagrodzenie BETWEEN 5000 AND 7000 THEN 'Średnie'
    ELSE 'Niskie'
END AS PoziomWynagrodzenia
FROM PracownicyProjekty;

SELECT NazwaProjektu, Budzet,
CASE 
    WHEN DataZakonczenia < CURRENT_DATE THEN 'Zakończony'
    WHEN DataZakonczenia >= CURRENT_DATE THEN 'W trakcie'
    ELSE 'Planowany'
END AS StatusProjektu
FROM ProjektyDetale;

SELECT pp.Imie, pp.Nazwisko, pd.NazwaProjektu 
FROM PracownicyProjekty pp
INNER JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pp.Nazwisko, pd.Budzet
FROM PracownicyProjekty pp
INNER JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pp.Imie, pp.Nazwisko, pd.Klient
FROM PracownicyProjekty pp
INNER JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pd.NazwaProjektu, pp.Nazwisko
FROM ProjektyDetale pd
INNER JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT pp.Imie, pp.Nazwisko, pd.DataRozpoczecia
FROM PracownicyProjekty pp
INNER JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pp.Imie, pp.Nazwisko, pd.NazwaProjektu
FROM PracownicyProjekty pp
LEFT JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pd.NazwaProjektu, pp.Imie
FROM ProjektyDetale pd
LEFT JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT pp.Imie, pp.Dzial, pd.NazwaProjektu
FROM PracownicyProjekty pp
LEFT JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pp.Imie, pp.Nazwisko, pd.Budzet
FROM PracownicyProjekty pp
LEFT JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pd.NazwaProjektu, pd.KierownikProjektu
FROM ProjektyDetale pd
LEFT JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT Imie, Nazwisko, Wynagrodzenie,
CASE 
    WHEN Wynagrodzenie > 7000 THEN 'Wysokie'
    WHEN Wynagrodzenie BETWEEN 5000 AND 7000 THEN 'Średnie'
    ELSE 'Niskie'
END AS PoziomWynagrodzenia
FROM PracownicyProjekty;

SELECT NazwaProjektu, Budzet,
CASE 
    WHEN DataZakonczenia < CURRENT_DATE THEN 'Zakończony'
    WHEN DataZakonczenia >= CURRENT_DATE THEN 'W trakcie'
    ELSE 'Planowany'
END AS StatusProjektu
FROM ProjektyDetale;

SELECT pp.Imie, pp.Nazwisko, pd.NazwaProjektu 
FROM PracownicyProjekty pp
INNER JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pp.Nazwisko, pd.Budzet
FROM PracownicyProjekty pp
INNER JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pp.Imie, pp.Nazwisko, pd.Klient
FROM PracownicyProjekty pp
INNER JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pd.NazwaProjektu, pp.Nazwisko
FROM ProjektyDetale pd
INNER JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT pp.Imie, pp.Nazwisko, pd.DataRozpoczecia
FROM PracownicyProjekty pp
INNER JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pp.Imie, pp.Nazwisko, pd.NazwaProjektu
FROM PracownicyProjekty pp
LEFT JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pd.NazwaProjektu, pp.Imie
FROM ProjektyDetale pd
LEFT JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT pp.Imie, pp.Dzial, pd.NazwaProjektu
FROM PracownicyProjekty pp
LEFT JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pp.Imie, pp.Nazwisko, pd.Budzet
FROM PracownicyProjekty pp
LEFT JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pd.NazwaProjektu, pd.KierownikProjektu
FROM ProjektyDetale pd
LEFT JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT pd.NazwaProjektu, pp.Nazwisko
FROM ProjektyDetale pd
RIGHT JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT pp.Imie, pp.Nazwisko, pd.NazwaProjektu
FROM PracownicyProjekty pp
RIGHT JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

SELECT pd.NazwaProjektu, COUNT(pp.PracownikID) AS LiczbaPracownikow
FROM ProjektyDetale pd
RIGHT JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt
GROUP BY pd.NazwaProjektu;

SELECT pd.NazwaProjektu, pp.Wynagrodzenie
FROM ProjektyDetale pd
RIGHT JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT pd.NazwaProjektu, pd.DataRozpoczecia
FROM ProjektyDetale pd
RIGHT JOIN PracownicyProjekty pp ON pd.NazwaProjektu = pp.Projekt;

SELECT pp.Imie, pd.NazwaProjektu
FROM PracownicyProjekty pp
CROSS JOIN ProjektyDetale pd;

SELECT pp.Imie, pd.DataRozpoczecia
FROM PracownicyProjekty pp
CROSS JOIN ProjektyDetale pd;

SELECT DISTINCT pp.Dzial, pd.Technologia
FROM PracownicyProjekty pp
CROSS JOIN ProjektyDetale pd;

SELECT pp.Imie, pd.Klient
FROM PracownicyProjekty pp
CROSS JOIN ProjektyDetale pd;

SELECT pp.Imie, pd.Budzet
FROM PracownicyProjekty pp
CROSS JOIN ProjektyDetale pd;

SELECT *
FROM PracownicyProjekty
NATURAL JOIN ProjektyDetale;

SELECT *
FROM ProjektyDetale
NATURAL JOIN PracownicyProjekty;

SELECT *
FROM PracownicyProjekty
NATURAL JOIN ProjektyDetale;

SELECT *
FROM PracownicyProjekty
NATURAL JOIN ProjektyDetale;

SELECT *
FROM ProjektyDetale
NATURAL JOIN PracownicyProjekty;

SELECT Imie, Nazwisko FROM PracownicyProjekty WHERE Dzial = 'IT'
UNION
SELECT Imie, Nazwisko FROM PracownicyProjekty WHERE Dzial = 'HR';

SELECT Imie, Nazwisko FROM PracownicyProjekty WHERE Dzial = 'IT'
UNION ALL
SELECT Imie, Nazwisko FROM PracownicyProjekty WHERE Dzial = 'HR';

SELECT NazwaProjektu FROM ProjektyDetale WHERE Status = 'W trakcie'
UNION
SELECT NazwaProjektu FROM ProjektyDetale WHERE Status = 'Zakończony';

SELECT Klient FROM ProjektyDetale WHERE Technologia = 'Java'
UNION ALL
SELECT Klient FROM ProjektyDetale WHERE Technologia = 'Python';

SELECT Imie, Nazwisko FROM PracownicyProjekty
UNION
SELECT KierownikProjektu AS Imie, NULL AS Nazwisko FROM ProjektyDetale;

UPDATE PracownicyProjekty
SET Wynagrodzenie = Wynagrodzenie * 1.10
WHERE Dzial = 'HR';

UPDATE ProjektyDetale
SET Status = 'Zakończony'
WHERE NazwaProjektu = 'Projekt X';

UPDATE ProjektyDetale
SET DataZakonczenia = DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY)
WHERE Status = 'W trakcie';

UPDATE PracownicyProjekty
SET Premia = 500
WHERE YEAR(DataPrzydzialu) = YEAR(CURRENT_DATE) AND Premia IS NULL;

UPDATE ProjektyDetale
SET Technologia = 'JavaScript'
WHERE Status = 'W trakcie';

DELETE FROM PracownicyProjekty
WHERE Projekt IN (
    SELECT NazwaProjektu
    FROM ProjektyDetale
    WHERE DataZakonczenia < '2024-01-01'
);

DELETE FROM ProjektyDetale
WHERE NazwaProjektu NOT IN (
    SELECT DISTINCT Projekt
    FROM PracownicyProjekty
);

DELETE FROM ProjektyDetale
WHERE Budzet < 50000;

DELETE FROM PracownicyProjekty
WHERE Dzial = 'Admin';

DELETE FROM ProjektyDetale
WHERE YEAR(DataZakonczenia) = 2023;

DROP TABLE ProjektyDetale;

TRUNCATE TABLE PracownicyProjekty;

ALTER TABLE PracownicyProjekty
ADD Adres VARCHAR(255);

ALTER TABLE PracownicyProjekty
MODIFY Wynagrodzenie DECIMAL(10, 2);

ALTER TABLE PracownicyProjekty
RENAME COLUMN Stanowisko TO Rola;

ALTER TABLE ProjektyDetale
MODIFY KierownikProjektu VARCHAR(150);

RENAME TABLE PracownicyProjekty TO Pracownicy;

CREATE VIEW WidokWynagrodzenia AS
SELECT Imie, Nazwisko, Wynagrodzenie
FROM PracownicyProjekty;

CREATE VIEW WidokPracownicyProjekty AS
SELECT pp.Imie, pp.Nazwisko, pd.NazwaProjektu, pd.Budzet
FROM PracownicyProjekty pp
JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

CREATE VIEW WidokZakonczoneProjekty AS
SELECT NazwaProjektu, DataZakonczenia
FROM ProjektyDetale
WHERE Status = 'Zakończony';

CREATE VIEW WidokSrednieWynagrodzenie AS
SELECT Dzial, AVG(Wynagrodzenie) AS SrednieWynagrodzenie
FROM PracownicyProjekty
GROUP BY Dzial;

CREATE VIEW WidokProjektyDuzyBudzet AS
SELECT NazwaProjektu, Budzet
FROM ProjektyDetale
WHERE Budzet > 200000;

CREATE INDEX idx_nazwisko ON PracownicyProjekty(Nazwisko);CREATE INDEX idx_nazwa_projektu ON ProjektyDetale(NazwaProjektu);

CREATE INDEX idx_dzial_wynagrodzenie ON PracownicyProjekty(Dzial, Wynagrodzenie);CREATE INDEX idx_status ON ProjektyDetale(Status);

CREATE INDEX idx_data_rozpoczecia ON ProjektyDetale(DataRozpoczecia);

SELECT * FROM PracownicyProjekty WHERE Nazwisko LIKE '%ski%';

SELECT * FROM ProjektyDetale WHERE NazwaProjektu LIKE '%A%';

SELECT * FROM PracownicyProjekty WHERE Imie LIKE 'J%';

SELECT * FROM ProjektyDetale WHERE Status LIKE 'W%';

SELECT * FROM ProjektyDetale WHERE NazwaProjektu LIKE '%2024';

UPDATE PracownicyProjekty
SET Wynagrodzenie = Wynagrodzenie * 1.10
WHERE Dzial = 'HR';

UPDATE ProjektyDetale
SET Status = 'Zakończony'
WHERE NazwaProjektu = 'Projekt X';

UPDATE ProjektyDetale
SET DataZakonczenia = DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY)
WHERE Status = 'W trakcie';

UPDATE PracownicyProjekty
SET Premia = 500
WHERE YEAR(DataPrzydzialu) = YEAR(CURRENT_DATE) AND Premia IS NULL;

UPDATE ProjektyDetale
SET Technologia = 'JavaScript'
WHERE Status = 'W trakcie';

DELETE FROM PracownicyProjekty
WHERE Projekt IN (
    SELECT NazwaProjektu
    FROM ProjektyDetale
    WHERE DataZakonczenia < '2024-01-01'
);

DELETE FROM ProjektyDetale
WHERE NazwaProjektu NOT IN (
    SELECT DISTINCT Projekt
    FROM PracownicyProjekty
);

DELETE FROM ProjektyDetale
WHERE Budzet < 50000;

DELETE FROM PracownicyProjekty
WHERE Dzial = 'Admin';

DELETE FROM ProjektyDetale
WHERE YEAR(DataZakonczenia) = 2023;

DROP TABLE ProjektyDetale;

TRUNCATE TABLE PracownicyProjekty;

ALTER TABLE PracownicyProjekty
ADD Adres VARCHAR(255);

ALTER TABLE PracownicyProjekty
MODIFY Wynagrodzenie DECIMAL(10, 2);

ALTER TABLE PracownicyProjekty
RENAME COLUMN Stanowisko TO Rola;

ALTER TABLE ProjektyDetale
MODIFY KierownikProjektu VARCHAR(150);

RENAME TABLE PracownicyProjekty TO Pracownicy;

CREATE VIEW WidokWynagrodzenia AS
SELECT Imie, Nazwisko, Wynagrodzenie
FROM PracownicyProjekty;

CREATE VIEW WidokPracownicyProjekty AS
SELECT pp.Imie, pp.Nazwisko, pd.NazwaProjektu, pd.Budzet
FROM PracownicyProjekty pp
JOIN ProjektyDetale pd ON pp.Projekt = pd.NazwaProjektu;

CREATE VIEW WidokZakonczoneProjekty AS
SELECT NazwaProjektu, DataZakonczenia
FROM ProjektyDetale
WHERE Status = 'Zakończony';

CREATE VIEW WidokSrednieWynagrodzenie AS
SELECT Dzial, AVG(Wynagrodzenie) AS SrednieWynagrodzenie
FROM PracownicyProjekty
GROUP BY Dzial;

CREATE VIEW WidokProjektyDuzyBudzet AS
SELECT NazwaProjektu, Budzet
FROM ProjektyDetale
WHERE Budzet > 200000;

CREATE INDEX idx_nazwisko ON PracownicyProjekty(Nazwisko);

CREATE INDEX idx_nazwa_projektu ON ProjektyDetale(NazwaProjektu);

CREATE INDEX idx_dzial_wynagrodzenie ON PracownicyProjekty(Dzial, Wynagrodzenie);

CREATE INDEX idx_status ON ProjektyDetale(Status);

CREATE INDEX idx_data_rozpoczecia ON ProjektyDetale(DataRozpoczecia);

SELECT * FROM PracownicyProjekty WHERE Nazwisko LIKE '%ski%';SELECT * FROM ProjektyDetale WHERE NazwaProjektu LIKE '%A%';

SELECT * FROM PracownicyProjekty WHERE Imie LIKE 'J%';

SELECT * FROM ProjektyDetale WHERE Status LIKE 'W%';

SELECT * FROM ProjektyDetale WHERE NazwaProjektu LIKE '%2024';

SELECT Imie, Nazwisko, Wynagrodzenie,
CASE 
    WHEN Wynagrodzenie > 8000 THEN 'Wysokie'
    WHEN Wynagrodzenie BETWEEN 5000 AND 8000 THEN 'Średnie'
    ELSE 'Niskie'
END AS KategoriaWynagrodzenia
FROM PracownicyProjekty;

SELECT NazwaProjektu, DataRozpoczecia,
CASE 
    WHEN DataRozpoczecia < CURRENT_DATE THEN 'Rozpoczęty'
    ELSE 'Niewystartowany'
END AS StatusProjektu
FROM ProjektyDetale;

SELECT NazwaProjektu, Budzet,
CASE 
    WHEN Budzet > 100000 THEN 'Duży'
    WHEN Budzet BETWEEN 50000 AND 100000 THEN 'Średni'
    ELSE 'Mały'
END AS TypBudzetu
FROM ProjektyDetale;

SELECT Imie, Nazwisko, Wynagrodzenie,
CASE 
    WHEN DataZatrudnienia < DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR) THEN 'Doświadczeni'
    ELSE 'Nowi'
END AS KategoriaPracownika
FROM PracownicyProjekty;

SELECT NazwaProjektu, Status, DataZakonczenia,
CASE 
    WHEN Status = 'Zakończony' THEN 'Zakończony'
    WHEN DataZakonczenia < CURRENT_DATE THEN 'Przegapiony'
    ELSE 'Aktualny'
END AS StatusProjektu
FROM ProjektyDetale;