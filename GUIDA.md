<div align="center">
<h1>🛠️ Guida locale 🧰</h1>

<h5>*Editing, compilazione PDF e push degli appunti.*</h5>

[![bash](https://img.shields.io/badge/bash-%234EAA25.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)  [![pandoc](https://img.shields.io/badge/pandoc-%23000000.svg?style=for-the-badge&logo=pandoc&logoColor=white)](https://pandoc.org)  [![LaTeX](https://img.shields.io/badge/LaTeX-%23008080.svg?style=for-the-badge&logo=latex&logoColor=white)](https://www.latex-project.org)  [![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com)

</div>

> [!NOTE]
> Questa è la guida per **chi lavora sugli appunti** (io e chi contribuisce). Se ti serve solo *leggerli*, vai sul [README](README.md). 🙂

## 🌿 I due branch: la cosa più importante
Il repo ha due branch e hanno due lavori diversi.

| Branch | A cosa serve | Cosa contengono i `.md` |
|---|---|---|
| **`main`** | ✍️ lavoro quotidiano, scrittura e correzioni | markdown "naturale" per Obsidian: callout, diagrammi `mermaid`, embed `![[...]]` |
| **`production`** | 📦 rilascio e generazione PDF | gli **stessi appunti** adattati a LaTeX: `mermaid` → TikZ, embed rimossi, sintassi che compila |

> [!IMPORTANT]
> **Regola d'oro:** si scrive su `main`, si pubblica da `production`.
> `production` non è un branch "vecchio": è la copia dei tuoi appunti resa compilabile. Se pushi su `main` e non aggiorni `production`, i PDF della release non contengono le tue modifiche.

## 🧰 Step 0 - Prerequisiti (una volta sola)
Per compilare in locale servono **pandoc**, **lualatex** e **zip**.

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
> In locale e in CI possono esserci **versioni diverse di pandoc** (es. 3.11 in locale, 3.1.13 nella workflow). Non è un problema, ma un flag può cambiare: `--highlight-style` è deprecato dalle pandoc recenti e dà solo un warning.

## ✍️ Step 1 - Mettersi sul branch giusto
```bash
cd <cartella degli appunti>
git checkout main
git pull origin main
```

> [!NOTE]
> `git status` deve dirti "nothing to commit" prima di iniziare. Se hai modifiche in sospeso del lavoro precedente, committale prima di tirare giù.

## 📝 Step 2 - Scrivere o sistemare gli appunti
Apri Obsidian (o l'editor che preferisci) e lavora sui file `.md` dentro la cartella della materia.

- Una cartella = una materia → il nome della cartella finisce nell'**intestazione del PDF** (a sinistra) e il nome del file a destra. 📄
- Un file `.md` = un PDF. Il nome del file diventa il nome del PDF, quindi **nomi sensati = PDF capibili**.
- `README.md` e `GUIDA.md` **non** vengono compilati.

### Sintassi che funziona bene 🎯
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

- I callout `>[!tipo]` diventano box colorati (i tipi non standard come `[!esercizio]` funzionano lo stesso).
- Le `$$` vanno **da sole sulla riga** e sempre **in coppia**.
- Il codice dentro i blocchi di codice viene reso con **wrap automatico** (niente righe tagliate).

## 🖨️ Step 3 - Compilare i PDF in locale
Dalla **root del repo** (dove c'è `header.tex`):

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

Poi, se ti servono gli archivi:
```bash
./zipFolders.sh
```
che produce un `.zip` per cartella (`Fisica 1_PDF.zip`, `Fisica 1_Markdown.zip`, ...).

### Cosa devi guardare alla fine 🧐
Lo script chiude con un riepilogo:
```
Generazione completata: 91 PDF ok, 0 falliti. File messi in /pdf.
```
e puoi sempre controllare il codice di uscita:
```bash
echo $?     # 0 = tutto ok, 1 = almeno un file è fallito
```

> [!TIP]
> Se qualche file fallisce, lo script stampa il nome del file e le ultime righe del log LaTeX. **Non ignorarlo**: un file che non compila oggi, in CI fa fallire la release intera.

> [!NOTE]
> I file temporanei (`temp.md`, `meta.tex`) non finiscono più nel vault: vivono in una cartella temporanea creata con `mktemp` e vengono cancellati automaticamente, anche se interrompi con `Ctrl+C`. La cartella `pdf/` è in `.gitignore`, quindi **non viene pushata**. 🧼

## ☠️ Cosa rompe la compilazione
Elenco di cose che fanno fallire un PDF:

| Problema | Come si manifesta | Fix |
|---|---|---|
| `$$` spaiato o con testo sulla stessa riga | `! Undefined control sequence. l.NN \$\$...` | chiudi le `$$` in coppia e mettile da sole sulla riga |
| Caratteri LaTeX speciali nel testo: `% & # _ $ { } ^ ~ \` | errori strani, testo sparito | escaparli: `\%` `\&` `\#` `\_` `\{` |
| Blocchi `mermaid` | diagramma assente o errore | converti in TikZ (vedi Step 4) |
| Embed `![[file.c]]` / `![[immagine.png]]` | contenuto mancante in silenzio | incolla il codice nel blocco, o rimuovi l'embed su `production` |
| Comandi LaTeX inventati (`\nonexistentmacro`) | `! Undefined control sequence` | usa solo ambienti e comandi dei pacchetti caricati da `header.tex` |
| File `.md` vuoto | PDF da 0 byte | lo script lo segnala come fallito |

## 🔀 Step 4 - Portare le modifiche su `production`
```bash
git checkout main
git add .
git commit -m "Aggiunto teorema degli zeri"
git push origin main

git checkout production
git merge main
```

A questo punto `production` ha i file *sporchi* di sintassi Obsidian: vanno adattati a LaTeX. Di solito sono **due operazioni ripetitive**:

##### 1. `mermaid` → TikZ
Su `main`:
```markdown
flowchart TD
A[prima] --> B{if}
B -- TRUE --> C[blocco if]
B --> D
```
*(ovviamente dentro un blocco ` ```mermaid ` su main)*

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
Su `production` gli embed Obsidian non vengono risolti: o il contenuto lo scrivi direttamente in un blocco di codice, o lo togli.

##### 3. Ricompilare su `production`
```bash
./createPdf.sh
echo $?
```
**Questo è il test vero:** se qui esce `1`, la release fallirà.

## 🚀 Step 5 - Push finale
```bash
git add .
git commit -m "Adattati appunti a LaTeX per produzione"
git push origin production
```

> [!NOTE]
> Se durante il merge ci sono conflitti su un `.md` che su `production` aveva già le modifiche LaTeX, **non risolvere cieco con `--theirs` o `--ours`**: risolvi a mano e poi ricompila.

## 📦 Step 6 - Release (e PDF automatici)
La workflow `.forgejo/workflows/pdf-convert.yaml` parte quando:
- pubblichi una **release**, oppure
- la lanci a mano con **Run workflow** (`workflow_dispatch`).

Per pubblicare:
1. Su Forgejo vai in **Releases → New release**.
2. Target branch: **`production`** ⚠️ (se la punti su `main`, i PDF escono con i `mermaid` e gli embed rotti).
3. Tag nuovo, tipo `Beta-4`.
4. Pubblica → la workflow installa pandoc + texlive, lancia `./createPdf.sh` e `./zipFolders.sh` e allega i `.zip` alla release.

> [!WARNING]
> Dopo il refactoring degli script, **la workflow fallisce davvero** se anche una sola nota non compila (prima finiva comunque "in verde" e pubblicava zip incompleti). Se una release è rossa, il problema è un `.md`, non la workflow.

## 🧯 Troubleshooting

##### "Errore compilazione: NomeNota"
Il numero `l.NN` del log è la riga del `.tex` generato, **non** del tuo `.md`. Per vedere il punto esatto:
```bash
pandoc "CartellaMateria/NomeNota.md" \
  -f markdown+wikilinks_title_after_pipe+hard_line_breaks \
  -H header.tex -t latex -o /tmp/nota.tex

sed -n '130,150p' /tmp/nota.tex
```

##### "Errore: header.tex non trovato"
Stai lanciando lo script da una cartella che non è la root del repo. `cd` nella cartella degli appunti e riprova.

##### "Errore: pandoc non risulta installato"
Torna allo Step 0 (lo script controlla `pandoc` e `lualatex` prima di partire).

##### "Errore: La cartella /pdf non esiste"
`zipFolders.sh` va eseguito **dopo** `createPdf.sh`.

##### I PDF sono lentissimi
Normale: lualatex mette ~3-4 secondi per nota, quindi una build completa sono alcuni minuti. Rilancia solo quando serve. 🐢

## ✅ Checklist rapida
```
[ ] git checkout main && git pull
[ ] scrivo/sistemo i .md in Obsidian
[ ] ./createPdf.sh  ->  echo $?  == 0
[ ] commit + push su main
[ ] git checkout production && git merge main
[ ] mermaid -> TikZ, tolgo embed ![[...]]
[ ] ./createPdf.sh su production  ->  echo $?  == 0
[ ] commit + push su production
[ ] release con target production
```
