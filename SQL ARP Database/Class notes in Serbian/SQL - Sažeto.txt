# Osnovna teorija SQL‑a

## Šta je SQL  
- **Structured Query Language**: deklarativni jezik za rad sa relacionim bazama  
- Obuhvata tri podjezika:  
  - **Query** (DQL): izražavanje upita (`SELECT`)  
  - **DML** (Data Manipulation Language): menjanje podataka (`INSERT`, `UPDATE`, `DELETE`)  
  - **DDL** (Data Definition Language): definicija šeme (`CREATE`, `ALTER`, `DROP`)  

## Ostali SQL podjezici i zadaci  
- **View DDL**: kreiranje/brisanje pogleda (`CREATE VIEW`, `DROP VIEW`)  
- **TCL** (Transaction Control): transakcije (`COMMIT`, `ROLLBACK`, `SAVEPOINT`)  
- **DCL** (Data Control): prava pristupa (`GRANT`, `REVOKE`)  
- **Ostalo**: automatsko održavanje kataloga (metadata), zaključavanje resursa (`LOCK TABLE`)

## Ključni zadaci SQL‑a  
1. **Upiti**: `SELECT`  
2. **Manipulacija podacima**: `INSERT`/`UPDATE`/`DELETE`  
3. **Definicija šeme**: `CREATE`/`ALTER`/`DROP`  
4. **Pogledi**: `CREATE VIEW`/`DROP VIEW`  
5. **Transakcije**: `COMMIT`/`ROLLBACK`/`SAVEPOINT`  
6. **Zaštita i zaključavanje**: `GRANT`/`REVOKE`/`LOCK TABLE`

## Osnovna struktura SELECT upita  
```sql
SELECT <lista_kolona>
  FROM <lista_tabela>
 [ WHERE <uslov> ]
 [ GROUP BY <lista_kolona> 
   [ HAVING <uslov_grupe> ] ]
 [ ORDER BY <lista_kolona> [ASC | DESC] ]
```

## Uslov selekcije (`WHERE`)  
- **Logički spojevi**: `AND`, `OR`, `NOT`  
- **Predikati**:  
  - Relacijski: `=`, `<>`, `<`, `<=`, `>`, `>=`  
  - `IS NULL` / `IS NOT NULL`  
  - `BETWEEN … AND …` / `NOT BETWEEN …`  
  - `LIKE` / `NOT LIKE` (džokeri `%`, `_`)  
  - `IN (v1, v2, …)` / `NOT IN (…)`  
  - `Θ ANY (lista)` / `Θ ALL (lista)`  (Θ ∈ {=, <, >, <=, >=, <>})  
  - `EXISTS (podupit)` / `NOT EXISTS (podupit)`

## Redosled izvršenja klauzula  
1. `FROM`  
2. `WHERE`  
3. `GROUP BY`  
4. `HAVING`  
5. `SELECT`  
6. `ORDER BY`

## Agregatne (skupovne) funkcije  
- `COUNT(*)`, `COUNT(kolona)`, `COUNT(DISTINCT kolona)`  
- `SUM(kolona)`, `SUM(DISTINCT kolona)`  
- `AVG(kolona)`, `AVG(DISTINCT kolona)`  
- `MIN(kolona)`, `MAX(kolona)`

## Grupisanje i filtriranje grupa  
- **`GROUP BY`** – deli torke u grupe  
- **`HAVING`** – kriterijum nad grupama (poput `WHERE`, ali posle agregacije)

## Spajanje tabela  
- **Implicitni (stari stil)**:  
  ```sql
  FROM t1, t2
   WHERE t1.pk = t2.fk
  ```  
- **Kvalifikacija kolona**: `tabela.kolona`

## Ugnježdeni upiti  
- **Nezavisni** (podupit ne zavisi od spoljnog)  
- **Zavisni** (podupit koristi vrednosti iz spoljnog upita)  
- Koriste se predikati `IN`, `ANY`, `ALL`, `EXISTS`

## Pogledi (views)  
- `CREATE VIEW ime AS <SELECT>`  
- `DROP VIEW ime`  
- Pogledi mogu da se koriste poput tabela u `SELECT`, `JOIN`, `GROUP BY`

