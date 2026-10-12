<div align="center">
<h1>🛠️ Guida al repo 🧰</h1>

<h5>*Come si lavora qui dentro: editing, compilazione PDF, pull request.*</h5>

[![bash](https://img.shields.io/badge/bash-%234EAA25.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)  [![pandoc](https://img.shields.io/badge/pandoc-%23000000.svg?style=for-the-badge&logo=pandoc&logoColor=white)](https://pandoc.org)  [![LaTeX](https://img.shields.io/badge/LaTeX-%23008080.svg?style=for-the-badge&logo=latex&logoColor=white)](https://www.latex-project.org)  [![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com)

</div>

> [!NOTE]
> Questa guida è per **chiunque tocchi questo repo**: contributor, collaboratori, e me. Se ti serve solo *leggere* gli appunti, guarda il [README](README.md). 🙂

## 🌿 I due branch: la cosa più importante
Il repo ha due branch con due lavori diversi.

| Branch | A cosa serve | Cosa contengono i `.md` |
|---|---|---|
| **`main`** | ✍️ scrittura e correzione quotidiana | markdown "naturale" per Obsidian: callout, diagrammi `mermaid`, embed `![[...]]` |
| **`production`** | 📦 da qui si generano i PDF | gli **stessi appunti** adattati a LaTeX: niente `mermaid`, niente embed, sintassi che compila |

> [!IMPORTANT]
> **Regola d'oro:** gli appunti si scrivono su `main`. `production` non è un branch "vecchio" o di backup: è la copia degli appunti resa compilabile. Se una modifica finisce solo su `main`, nei PDF non c'è.

## 🔀 Il flusso di lavoro, in ordine
```
1. appunti "sporchi" su main              (markdown Obsidian)
2. merge main -> production
3. su production adatti i .md a LaTeX     (via callout, via embed, mermaid -> TikZ)
4. verifichi la compilazione e correggi   finché ./createPdf.sh esce 0
5. release -> la workflow genera i PDF
```

> [!WARNING]
> I passi **2, 3, 4 e 5** sono roba da **mantenitore**: al momento è uno solo (Nik). Se contribuisci, il tuo lavoro finisce al passo **1 + pull request**. 🙋

## 🙋 Step 1 - Come si manda una modifica: sempre via pull request
**Non si pusha mai direttamente su `main` o `production`.** Ogni modifica passa da un branch tuo e una pull request.

```bash
git checkout main
git pull origin main

git checkout -b appunti/teorema-degli-zeri     # branch tuo, nome parlante

# ... scrivi / sistemi i .md ...

git add "Analisi 1/Teorema degli zeri.md"
git commit -m "Aggiunto teorema degli zeri con esempio"
git push origin appunti/teorema-degli-zeri
```

Dopo il push apri la **pull request** su Forgejo:
- **source:** il tuo branch (`appunti/teorema-degli-zeri`)
- **target:** `main` (il caso normale: contenuto di appunti)
- se non hai accesso in scrittura sul repo: prima fai **fork**, poi la PR dal tuo fork

Nella descrizione della PR scrivi in due righe: quali file hai toccato, cosa hai aggiunto/corretto, e se hai lanciato `./createPdf.sh` in locale (con l'esito).

### Su cosa punta la PR 🎯

| Che tipo di modifica è | Target della PR |
|---|---|
| appunti nuovi, correzioni di contenuto, spiegazioni, errori di trascrizione | **`main`** (quasi sempre) |
| solo sistemazioni per far compilare: `mermaid` → TikZ, embed tolti, `$$` rotte, caratteri da escapare | **`production`** |

> [!IMPORTANT]
> **La traduzione `main` → `production` non si fa dentro la PR dei contenuti.** Su `main` si scrive markdown naturale e basta: dopo il merge, l'adattamento LaTeX se lo vede il mantenitore. Una PR che porta già la "versione prod" di una nota rende solo più difficile leggere il diff. 🙅
> Se invece la PR serve *solo* a sistemare la compilazione, allora sì: branch da `production` e PR verso `production`.

## 🧰 Step 2 - Prerequisiti per compilare in locale (una volta sola)
Servono **pandoc**, **lualatex** e **zip**.

##### 🐧 Debian / Ubuntu
```bash
sudo apt update
sudo apt install -y pandoc texlive-luatex texlive-latex-extra texlive-lang-italian fonts-dejavu zip
```
##### 🐧 Arch
```bash
sudo pacman -S --needed pandoc texlive-basic texlive-latexextra texlive-langitalian dejavu zip
```
*(i nomi dei pacchetti texlive su Arch cambiano ogni tanto: se uno non esiste, cercalo con `pacman -Ss texlive`)*

##### 🍎 MacOS
```bash
brew install pandoc mactex-no-gui zip
```

##### Verifica che tutto ci sia
```bash
pandoc --version | head -1
lualatex --version | head -1
zip -v | head -1
```

> [!WARNING]
> In locale e nella workflow possono esserci **versioni diverse di pandoc** (es. 3.11 in locale, 3.1.13 in CI). Non è un problema, ma qualche flag cambia: `--highlight-style` nelle pandoc recenti è deprecato e stampa solo un warning.

## ✍️ Step 3 - Scrivere gli appunti
Lavora sui `.md` dentro la cartella della materia, con Obsidian (o l'editor che preferisci).

- Una cartella = una materia → il nome della cartella finisce nell'**intestazione del PDF** a sinistra, il nome del file a destra. 📄
- Un file `.md` = un PDF, e il nome del file diventa il nome del PDF: **nomi sensati = PDF capibili**.
- `README.md`, `GUIDA.md` e `AGENTS.md` **non** vengono compilati.
- Il blocco YAML in testa ai file (`id`, `aliases`, `tags`) è roba da Obsidian: pandoc lo legge come metadati e **non lo stampa nel PDF**, quindi puoi usarlo tranquillamente.

### Sintassi che rende bene 🎯
```markdown
>[!esercizio] Titolo del blocco
>Contenuto del callout.

$$
\begin{cases}
a + b = c \\
b = 2
\end{cases}
$$
```

- I callout `>[!tipo]` diventano box colorati (anche tipi non standard come `[!esercizio]`).
- Le `$$` vanno **da sole sulla riga** e sempre **in coppia**.
- Il codice dentro i blocchi di codice viene reso con **wrap automatico** (niente righe tagliate).

## 🖨️ Step 4 - Compilare i PDF in locale
Dalla **root del repo** (la cartella dove c'è `header.tex`):

```bash
./createPdf.sh
```

Output:
```
pdf/
├── Fisica 1_PDF/
│   └── Legge oraria.pdf
├── Fisica 1_Markdown/
│   └── Legge oraria.md
├── Analisi 1_PDF/
│   └── ...
```

Se ti servono anche gli archivi:
```bash
./zipFolders.sh      # un .zip per cartella: "Fisica 1_PDF.zip", "Fisica 1_Markdown.zip", ...
```

### Cosa guardare alla fine 🧐
```
Generazione completata: 91 PDF ok, 0 falliti. File messi in /pdf.
```
```bash
echo $?     # 0 = tutto ok, 1 = almeno un file è fallito
```

> [!TIP]
> Se un file fallisce, lo script stampa il nome e le ultime righe del log LaTeX. **Non ignorarlo**: una nota che non compila in locale fa fallire anche la workflow.

> [!NOTE]
> I file temporanei (`temp.md`, `meta.tex`) non finiscono nel vault: vivono in una cartella creata con `mktemp` e vengono cancellati da soli, anche se interrompi con `Ctrl+C`. La cartella `pdf/` è in `.gitignore`, quindi **non viene committata né pushata**. 🧼

## ☠️ Cosa rompe la compilazione
Queste cose fanno **fallire** il PDF:

| Problema | Errore tipico | Fix |
|---|---|---|
| `$$` spaiati, o testo sulla stessa riga delle `$$` | `! Undefined control sequence. l.NN ...` | chiudi le `$$` in coppia e mettile da sole sulla riga |
| Caratteri LaTeX nel testo: `% & # _ $ { } ^ ~ \` | errori strani, testo sparito | escapali: `\%` `\&` `\#` `\_` `\{` |
| Comandi LaTeX inventati (`\nonexistentmacro`) | `! Undefined control sequence` | usa solo ambienti e comandi dei pacchetti caricati da `header.tex` |
| Nome del file con `& % # _ $ { }` | si rompe l'intestazione del PDF | rinomina il file |
| File `.md` vuoto | PDF da 0 byte | lo script lo segnala (o lo salta se proprio vuoto) |

Queste invece **compilano ma producono un PDF brutto/monco**:

| Costrutto | Cosa succede nel PDF | Cosa fare |
|---|---|---|
| Embed `![[file.c]]` / `![[immagine.png]]` | pandoc non trova la risorsa e la sostituisce con il testo alternativo: contenuto **perso in silenzio** | incolla il contenuto in un blocco di codice, o togli l'embed |
| Blocchi ` ```mermaid ` | il sorgente mermaid finisce nel PDF come blocco di codice | converti in TikZ (vedi sotto) |
| Callout foldable `>[!note]-` | il `-` resta nel testo | su `production` togli il `-` o il callout |

## 🔧 Step 5 - Adattare i file su `production`

Questo lavoro **non sta nelle PR di contenuto**: dopo il merge su `main`, il mantenitore apre un branch suo e fa la traduzione `main` → `production` (oppure, se deve solo sistemare la compilazione, parte direttamente da `production`).

##### 1. `mermaid` → TikZ
Su `main`:
```markdown
flowchart TD
A[prima] --> B{if}
B -- TRUE --> C[blocco if]
B --> D
```
*(dentro un blocco ` ```mermaid `)*

Su `production`:
```latex
\begin{center}
\begin{tikzpicture}[node distance=1.5cm and 2cm, auto]
    \node [terminal] (A) {prima};
    \node [decision, below=of A] (B) {if};
    \node [terminal, below=of B] (D) {dopo};
    \node [process, right=of B] (C) {blocco if};

    \draw [arrow] (A) -- (B);
    \draw [arrow] (B) -- node[above] {TRUE} (C);
    \draw [arrow] (B) -- node[right] {FALSE} (D);
    \draw [arrow] (C) |- (D);
\end{tikzpicture}
\end{center}
```

> [!TIP]
> Gli stili `terminal`, `process`, `decision` e `arrow` sono **già definiti** in `header.tex`: non devi ridefinirli. Le librerie TikZ caricate sono `positioning`, `shapes.geometric`, `arrows.meta`.

##### 2. Togliere gli embed `![[...]]`
Su `production` non vengono risolti: o il contenuto lo scrivi direttamente in un blocco di codice, o lo togli.

##### 3. Callout
Il marcatore `>[!tipo]` viene **rimosso in automatico** da `createPdf.sh`, che trasforma il callout in una citazione (e `header.tex` la rende un box). Quindi un callout semplice su `production` può restare: si toglie a mano quando dentro c'è roba Obsidian-specifica (foldable `>-`, callout annidati, embed dentro il callout).

> [!NOTE]
> Residui ancora presenti su `production`, da ripulire alla prima occasione: `![[...]]` in `Fondamenti di Informatica/C.md`, `Liste a puntatori.md`, `Tipi di dato strutturati.md`, e un blocco `mermaid` in `Fisica 1/Cosa è la Fisica?.md`.

## 🧪 Step 6 - Verifica della compilazione
Su `production`, dopo le modifiche:
```bash
./createPdf.sh
echo $?      # deve essere 0
```
**Questo è il test vero:** se esce `1`, la release genererà PDF mancanti o una workflow rossa.

Se qualcosa non compila, correggi e rilancia. Quando tutto esce `0`, apri la PR del branch di adattamento verso `production`, mergeala e si procede con la release.

> [!WARNING]
> Dopo il refactoring degli script, **la workflow fallisce davvero** se anche una sola nota non compila (prima finiva "in verde" e pubblicava zip incompleti). Se una workflow è rossa, il problema è un `.md`, non la workflow.

## 🧯 Troubleshooting

##### "Errore compilazione: NomeNota"
Il numero `l.NN` nel log è la riga del `.tex` **generato**, non del tuo `.md`. Per vedere il punto esatto:
```bash
pandoc "CartellaMateria/NomeNota.md" \
  -f markdown+wikilinks_title_after_pipe+hard_line_breaks \
  -H header.tex -t latex -o /tmp/nota.tex

sed -n '130,150p' /tmp/nota.tex
```

##### "Errore: header.tex non trovato"
Stai lanciando lo script da una cartella che non è la root del repo. `cd` nella cartella degli appunti e riprova.

##### "Errore: pandoc non risulta installato"
Torna allo Step 2 (lo script controlla `pandoc` e `lualatex` prima di partire).

##### "Errore: La cartella /pdf non esiste"
`zipFolders.sh` va eseguito **dopo** `createPdf.sh`.

##### I PDF sono lentissimi
Normale: lualatex mette ~3-4 secondi per nota, una build completa sono alcuni minuti. Rilancia solo quando serve. 🐢

## ✅ Checklist

##### Se contribuisci 🙋
```
[ ] branch nuovo da main          git checkout -b appunti/...
[ ] scrivo/sistemo i .md
[ ] ./createPdf.sh  ->  informativo: su main non serve exit 0, il gate e' su production
[ ] commit con messaggio chiaro
[ ] push del branch + pull request verso main
[ ] non traduco niente in LaTeX per production: lo fa il mantenitore
```

##### Se sei il mantenitore 🔑

*PR di contenuto* (appunti nuovi o correzioni):
```
[ ] merge della PR su main
[ ] git checkout production && git merge main
[ ] mermaid -> TikZ, tolgo embed, sistemo callout
[ ] ./createPdf.sh su production  ->  echo $?  == 0
[ ] PR del branch di adattamento -> production, merge
[ ] release (i PDF li genera la workflow)
```

*PR solo di produzione* (fix di compilazione, nessun contenuto nuovo):
```
[ ] branch creato da production
[ ] sistemo LaTeX e ./createPdf.sh  ->  echo $?  == 0
[ ] PR -> production, merge
[ ] se la correzione serve anche su main, PR separata su main
[ ] release
```