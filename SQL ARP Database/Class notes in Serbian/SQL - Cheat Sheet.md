#SQL - cheat sheet

---

## 1. Kreiranje baze i tabele

### CREATE DATABASE
```sql
CREATE DATABASE ime_baze;
```

### CREATE TABLE
```sql
CREATE TABLE ime_tabele (
    kolona1 tip_podatka [CONSTRAINT],
    kolona2 tip_podatka [CONSTRAINT],
    ...
);
```

**Primer:**
```sql
CREATE TABLE korisnici (
    id INT PRIMARY KEY,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    email VARCHAR(100) UNIQUE
);
```

---

## 2. Umetanje podataka

### INSERT INTO
```sql
INSERT INTO ime_tabele (kolona1, kolona2, ...)
VALUES (vrednost1, vrednost2, ...);
```

**Primer:**
```sql
INSERT INTO korisnici (id, ime, prezime, email)
VALUES (1, 'Marko', 'Marković', 'marko@email.com');
```

---

## 3. Čitanje podataka

### SELECT
```sql
SELECT kolona1, kolona2 FROM ime_tabele;
-- ili sve kolone:
SELECT * FROM ime_tabele;
```

**Primer:**
```sql
SELECT * FROM korisnici;
```

---

## 4. Ažuriranje podataka

### UPDATE
```sql
UPDATE ime_tabele
SET kolona1 = nova_vrednost
WHERE uslov;
```

**Primer:**
```sql
UPDATE korisnici
SET email = 'novi@email.com'
WHERE id = 1;
```

---

## 5. Brisanje podataka

### DELETE
```sql
DELETE FROM ime_tabele
WHERE uslov;
```

**Primer:**
```sql
DELETE FROM korisnici
WHERE id = 1;
```

⚠ **UPOZORENJE:** Ako izostaviš `WHERE`, brišeš sve redove.

---

## 6. Izmene u tabeli

### ALTER TABLE – Dodavanje kolone
```sql
ALTER TABLE ime_tabele
ADD kolona tip_podatka;
```

### ALTER TABLE – Brisanje kolone
```sql
ALTER TABLE ime_tabele
DROP COLUMN kolona;
```

### ALTER TABLE – Promena tipa kolone (zavisi od DBMS-a)
```sql
ALTER TABLE ime_tabele
ALTER COLUMN kolona TYPE novi_tip; -- PostgreSQL
```

---

## 7. Brisanje tabela i baza

### DROP TABLE
```sql
DROP TABLE ime_tabele;
```

### DROP DATABASE
```sql
DROP DATABASE ime_baze;
```

---

## 8. Filtriranje i uslovi

### WHERE
```sql
SELECT * FROM tabela WHERE uslov;
```

**Primer:**
```sql
SELECT * FROM korisnici WHERE ime = 'Marko';
```

### Operatori
- `=` jednako
- `!=` ili `<>` nije jednako
- `>` veće od
- `<` manje od
- `>=`, `<=` veće/manje ili jednako
- `BETWEEN`, `IN`, `LIKE`, `IS NULL`

**Primeri:**
```sql
SELECT * FROM korisnici WHERE ime LIKE 'M%';
SELECT * FROM korisnici WHERE id BETWEEN 1 AND 10;
```

---

## 9. Sortiranje

### ORDER BY
```sql
SELECT * FROM tabela
ORDER BY kolona [ASC|DESC];
```

**Primer:**
```sql
SELECT * FROM korisnici ORDER BY prezime DESC;
```

---

## 10. Ograničavanje rezultata

### LIMIT (MySQL/PostgreSQL)
```sql
SELECT * FROM tabela LIMIT 10;
```

### TOP (SQL Server)
```sql
SELECT TOP 10 * FROM tabela;
```

---

## 11. Grupisanje i agregatne funkcije

### GROUP BY
```sql
SELECT kolona, COUNT(*) FROM tabela
GROUP BY kolona;
```

### Agregatne funkcije:
- `COUNT()` – broj redova
- `SUM()` – suma
- `AVG()` – prosek
- `MIN()` – minimum
- `MAX()` – maksimum

**Primer:**
```sql
SELECT ime, COUNT(*) FROM korisnici
GROUP BY ime;
```

---

## 12. Spajanje tabela (JOIN)

### INNER JOIN
```sql
SELECT *
FROM tabela1
INNER JOIN tabela2 ON tabela1.kljuc = tabela2.kljuc;
```

### LEFT JOIN / RIGHT JOIN
```sql
SELECT *
FROM tabela1
LEFT JOIN tabela2 ON ...
```

---

## 13. Ključevi i veze

### PRIMARY KEY
Jedinstven identifikator reda (ne može biti NULL).

```sql
id INT PRIMARY KEY
```

### FOREIGN KEY
Veza između dve tabele.

```sql
FOREIGN KEY (kolona) REFERENCES druga_tabela(kolona)
```

---

## 14. Pogledi (Views)

### CREATE VIEW
```sql
CREATE VIEW ime_viewa AS
SELECT kolona1, kolona2 FROM tabela WHERE uslov;
```

### DROP VIEW
```sql
DROP VIEW ime_viewa;
```

---

## 15. Indeksi

### CREATE INDEX
```sql
CREATE INDEX ime_indeksa
ON tabela (kolona);
```

---

## 16. Transakcije (osnovno)

```sql
BEGIN;
-- neka SQL komanda
COMMIT;   -- potvrda
ROLLBACK; -- poništavanje
```

---

## 17. Ograničenja (CONSTRAINTS)

- `PRIMARY KEY`
- `FOREIGN KEY`
- `UNIQUE`
- `NOT NULL`
- `CHECK (uslov)`
- `DEFAULT`

---
