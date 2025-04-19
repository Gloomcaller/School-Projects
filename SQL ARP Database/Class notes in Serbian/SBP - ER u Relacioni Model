## 1. Entiteti

- Svaki entitet postaje jedna **relacija (tabela)** sa istim imenom.
- Atributi entiteta postaju **kolone tabele**.
- Primarni ključ entiteta postaje **primarni ključ relacije**.

**Primer:**
ER entitet `Predmet(šifra, naziv)`  
→ Relacija: `Predmet(šifra, naziv)` sa primarnim ključem `šifra`

---

## 2. Veze (Poveznici)

### 2.1 Veza M:N (više prema više)

- Kreira se **posebna tabela**.
- Tabela sadrži **primarne ključeve** oba entiteta kao **strane ključeve**.
- Po potrebi se dodaju dodatni atributi.

**Primer:**
`Radnik Radi Projekat` (M:N)  
→ `Radi(mbr, ozp, brc)` sa PK `(mbr, ozp)`

---

### 2.2 Veza 1:N (jedan prema više)

- **Prostiranje ključa**: PK entiteta sa **1** strane dodaje se kao **strani ključ** u entitet sa **N** stranom.

**Primer:**
`Radnik Raspoređen Radno_mesto` (1:N)  
→ `Radnik(mbr, ime, prz, ozrm)` (ozrm FK ka `Radno_mesto(ozrm)`)

---

### 2.3 Veza 1:1

- Ako su donji kardinaliteti 0:0 ili 1:0 → prostiranje ključa u stranu sa donjim kardinalitetom 1.
- Ako su donji kardinaliteti 1:1 → može se spojiti u jednu tabelu.

**Primer:**
`Radnik Osiguran Polisa` (1:1)  
→ `Radnik(mbr, ime, prz, brp)`  
→ `Polisa(brp, dat, izn)`, FK: `Radnik.brp → Polisa.brp`

---

## 3. Slabi entiteti

- Nemaju sopstveni ključ – koriste **primarni ključ nadređenog entiteta** + **svoj identifikator** kao **složeni PK**.
- Obavezno dodati **FK ka nadređenom entitetu**.

**Primer:**
`Dete(sifr, rbr, ime)` zavisi od `Roditelj(sifr)`  
→ `Dete(sifr, rbr, ime)` sa PK `(sifr, rbr)`, FK: `sifr → Roditelj.sifr`

---

## 4. Rekurzivne veze

- **1:N** → prostiranje ključa sa 1 strane, mora se **preimenovati kolona**.
- **M:N** → posebna tabela kao kod običnih veza.

**Primer (1:N):**
`Radnik rukovodi Radnik`  
→ `Radnik(mbr, ime, prz, sef)` gde je `sef` FK ka `Radnik(mbr)`

---

## 5. IS-A Hijerarhija (Generalizacija/Specializacija)

### Pristup 1 – Jedna tabela po entitetu
- Roditeljski entitet sadrži opšte atribute.
- Svaka specijalizacija ima svoju tabelu sa PK koji je FK ka roditelju.

**Primer:**
`Stanovnik(jmbr, ime, prz, zan)`  
`Student(jmbr, bri, bpi)`  
`Radnik(jmbr, ozr, spr)`

### Pristup 2 – Samo podklase (ako je totalna generalizacija)
- Svaka podklasa ima i atribute roditelja.

**Primer:**
`Student(jmbr, ime, prz, zan, bri, bpi)`

### Pristup 3 – Jedna tabela za celu hijerarhiju
- Koristi se ako su svi entiteti podvrste.

**Primer:**
`Stanovnik(jmbr, ime, prz, zan, bri, bpi, ozr, spr)`

---

## 6. Gerund (entitet koji predstavlja vezu)

- Tretira se kao običan entitet.
- Preko njega se prave dodatne veze (kao M:N sa dodatnim svojstvima).

---

## 7. Redosled prevođenja

1. Prevedi entitete u tabele.
2. Dodaj atribute i ključeve.
3. Prevedi veze:
   - M:N → posebne tabele
   - 1:N i 1:1 → prostiranje ključa (kada može)
4. Dodaj sve neophodne **referencijalne integritete**.
5. Dodaj **NOT NULL** ako je donji kardinalitet 1.
6. Reši IS-A hijerarhije na jedan od tri načina.

---
