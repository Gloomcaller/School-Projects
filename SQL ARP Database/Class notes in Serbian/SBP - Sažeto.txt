# 1. Osnovni pojmovi

## Tipovi podataka
- Definicija: skup dozvoljenih vrednosti + operacije nad njima  
- Primeri: `INT`, `BOOLEAN`, `CHAR`, `VARCHAR`, `DATE`

## Apstrakcija
1. **Podataka**: logički model (tabele, veze) odvojen od fizičkog skladištenja  
2. **Procedura**: funkcionalnost (SQL operacije, transakcije) odvojena od implementacije

## Baza podataka (BP)
- Skup povezanih podataka sa minimalnom redundansom  
- Nezavisna od aplikacija  
- Podržava rast i održavanje konzistentnosti  
- **Šema vs. instanca**: šema = struktura (tabele/veze), instanca = podaci u konkretnom trenutku  
- **Metadata (katalog)**: informacije o strukturi baze

## DBMS (SUBP)
- Softver za kreiranje, čuvanje, ažuriranje i zaštitu podataka  
- Komponente:  
  - **Menadžer skladišta** (fizičko čuvanje)  
  - **Izvršavanje upita** (parser, optimizator)  
  - **Kontrola pristupa** (autorizacija)  
  - **Transakcioni menadžer** (ACID)  
  - **Katalog/metadatabaza**  

## Arhitektura baza
- **Troslojna (ANSI/SPARC)**:  
  1. **Internalno** (fizički format)  
  2. **Logičko** (šema baze)  
  3. **Eksterno** (pogledi korisnika)  
- **Data independence**:  
  - **Fizička**: promena načina čuvanja bez uticaja na logičku šemu  
  - **Logička**: promena logičke šeme bez uticaja na aplikacije

## Relacioni upitni jezik (SQL)
- DDL (Data Definition Language): `CREATE`, `ALTER`, `DROP`  
- DML (Data Manipulation Language): `SELECT`, `INSERT`, `UPDATE`, `DELETE`  
- DCL (Data Control Language): `GRANT`, `REVOKE`  
- TCL (Transaction Control Language): `COMMIT`, `ROLLBACK`

## Transakcija
- Atomarni blok operacija nad bazom  
- ACID svojstva:  
  - **A**tomost  
  - **C**onsistency  
  - **I**solation  
  - **D**urability  

# 2. Slabosti klasičnih („flat‐file“) sistema
- **Redundansa & nekonzistentnost**: duplirani zapisi  
- **Izolacija fajlova**: svaki format zahteva poseban program  
- **Održavanje integriteta**: teško dodavanje/menjanje pravila  

# 3. Modelovanje podataka

## Konceptualno modelovanje
1. **Selekcija**: odaberi bitne entitete i veze  
2. **Imenovanje**: termina bliska korisnicima  
3. **Klasifikacija**: grupiši slične entitete  
4. **Iteracija**: pregledi i ispravke dok model nije potpun i tačan  

## Tipovi šema
- **Konceptualna šema**: E‑R model  
- **Logička šema**: relacione tabele  
- **Fizička šema**: fajlovi, indeksi, raspored zapisa  

# 4. Entitet‐Veza (E‑R) model

## Entitet
- Identifikovani objekat ili pojam  
- Atributi (+ domeni)  
- Primarni ključ (PK)

## Atributi
- **Prosti** (atomarni)  
- **Složeni** (npr. `adresa` → `ulica`, `grad`, `poštanski_broj`)  
- **Izvedeni** (računaju se iz drugih, npr. `starost` iz `datum_rođenja`)  
- Birati razumno broj i tip atributa  

## Veze
- **Kardinalnost**: 1:1, 1:N, N:M  
- **Stepen veze**: binarna, terarna, n‑arna, rekurzivna  
- **Participacija**:  
  - *Totalna* (svaki entitet učestvuje)  
  - *Delimična* (nije obavezno)

## Slabi entitet
- Zavisnost: egzistencijalna + identifikaciona  
- PK = PK jačeg entiteta + sopstveni atributi  
- Prikaz: dvostruki pravougaonik + strelica

## Generalizacija / Specijalizacija
- Nadtip (superklasa) ← podtipovi (subklase)  
- **IS_A** hijerarhija  
- Parametri: *totalno/parcijalno*, *disjunktno/presečno*  

## Gerund (entitet od veze)
- Za n‑arne veze ili veze sa atributima  
- Postaje zaseban entitet sa sopstvenom tabelom

# 5. Data modeli

| Model          | Veze             | Prednosti                           | Nedostaci             |
| -------------- | ---------------- | ----------------------------------- | --------------------- |
| Flat‐file      | –                | jednostavno                         | redundansa, izolacija |
| Hijerarhijski  | 1:N (pointer)    | brzo čitanje                        | nema N:M, rigidno     |
| Mrežni         | M:N (pointer)    | fleksibilne veze                    | kompleksno            |
| Relacioni      | tabele + ključevi| matematička osnova, nema redundansa | –                     |
| Objektni       | direktni objekti | bolje performanse                   | manje standardizovano |

# 6. Relacioni model

- **Relacija**: tabela `(ime, atributi, tuplovi)`  
- Temelji se na **teoriji skupova** i **predikata**  
- **Integritetni uslovi**:  
  - **Domain constraint**: svaka kolona prihvata samo vrednosti iz domena  
  - **Entity constraint**: svaki tupl ima jedinstveni PK  
  - **Referential integrity**: FK → PK drugе tabele ili NULL (ako dozvoljeno)  
- **Relaciona algebra**: σ (selekcija), π (projekcija), ∪, −, ×, ⨝  
- **Normalizacija**:  
  - **1NF**: svi atributi atomarni  
  - **2NF**: 1NF + nema delimičnih zavisnosti od dela PK  
  - **3NF**: 2NF + nema tranzitivnih zavisnosti  

# 7. Preslikavanje ER → Relacioni

1. **Entitet** → tabela  
2. **Atributi** → kolone  
3. **PK** entiteta → PK tabele  

## Veze  
- **M:N** → posebna tabela sa FK ka oba entiteta (i sopstvenim atributima)  
- **1:N** → prostiranje PK („1“ strane) kao FK u tabelu „N“ strane  
  - minimalni kardinalitet = 1 → `NOT NULL`  
  - minimalni kardinalitet = 0 → `NULL` dozvoljen  
- **1:1** → obično prostiranje, ili jedna tabela (ako obe strane uvek postoje)

## Specijalni slučajevi  
- **Slabi entitet** → PK nadređenog + sopstveni atributi (složeni PK)  
- **Rekurzivne veze** → FK isti entitet (preimenuj kolonu za ulogu)  
- **Gerund** → kao M:N: nova tabela + FK + eventualni atributi  
