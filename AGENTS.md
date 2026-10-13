# AGENTS.md

Obsidian markdown notes vault (university lectures, Italian). Not a software project: the only build is markdown -> PDF via pandoc + lualatex.

## Two branches — the thing to get right first

- `main`: notes in natural Obsidian markdown (callout, `mermaid`, `![[embeds]]`, wikilinks). All content work happens here.
- `production`: the same notes adapted so they compile as LaTeX. Releases/tags (`Beta-*`) are cut **here**, so CI builds production's files.
- Never push to either. Branch + PR: content PRs target `main`; PRs that only fix compilation branch from and target `production`. Do not pre-translate content PRs into LaTeX.
- `createPdf.sh`, `zipFolders.sh`, `header.tex` and `.gitignore` are **identical on both branches** — run `git diff main production --stat` instead of assuming. What differs is note content: `production` carries the LaTeX translations (TikZ instead of `mermaid`, embeds removed), `main` carries the Obsidian form. Pre-refactor script behaviour exists only in history (`12a0f7d`, tag `Beta-3`); if you ever find `temp.md` or `meta.tex` sitting in the repo root, you are on a stale branch.
- `main` is a working Obsidian vault, not just a source tree: a note name Obsidian cannot open is a bug even when the PDF compiles.

## Where compilation actually matters

`./createPdf.sh` must exit `0` on **`production`**: releases are cut there, and a non-zero exit fails the workflow step, so `zipFolders.sh` and the upload step never run — the release gets **no** PDFs and no zips and the run is red. It is not "one note missing from an otherwise fine release". On `main` a non-zero exit is **not** mandatory and not a blocker for a content PR — notes there are still in Obsidian form. Run the build on `main` to learn what will break later, not as a gate.

When a note fails on `production`, fix it in the least destructive order: a `header.tex` definition -> a markdown syntax fix -> ask the maintainer before touching the note's content or renaming a file. Shared fixes in `header.tex` travel with the `main` -> `production` merge; edits to a single note do not help other notes.

## Verification

- Full build, from the repo root (the folder that holds `header.tex`): `./createPdf.sh` then `echo $?` — `0` all notes compiled, `1` at least one failed. Takes minutes (lualatex is ~3-4s per note).
- Fast single-note check. It needs the two header macros: without them pandoc exits **43** with `Error producing PDF.` / `! Undefined control sequence.` — a different exit code from the `1` that `createPdf.sh` returns.

  ```bash
  printf '\\newcommand{\\headerTitolo}{Legge oraria}\n\\newcommand{\\headerMateria}{Fisica 1}\n' > /tmp/m.tex
  pandoc - -f markdown+wikilinks_title_after_pipe+hard_line_breaks --pdf-engine=lualatex \
    -V lang=it-IT -H /tmp/m.tex -H header.tex -o /tmp/nota.pdf < "Fisica 1/Legge oraria.md"
  ```

  This bypasses `createPdf.sh`'s preprocessing, so the `$$` pairing gate and the callout stripping do **not** run: use it to read a LaTeX error quickly, not to declare a note compilable.

- `./zipFolders.sh` only **after** `createPdf.sh` (it errors if `pdf/` is missing).
- CI (`.forgejo/workflows/pdf-convert.yaml`) triggers only on `release: published` and `workflow_dispatch`. It never validates a push or a PR — the local build is the test.
- Local pandoc is 3.11, CI pins 3.1.13. `--highlight-style` prints a deprecation warning on newer pandoc: a warning is not a failure.

## Build facts that change how you edit a note

- pandoc input is `markdown+wikilinks_title_after_pipe+hard_line_breaks`: single newlines in the source become hard line breaks in the PDF. Reflowing or joining source lines changes PDF layout.
- One folder = one subject; the folder name goes in the PDF header left, the file name goes header right and becomes the PDF's name. Root-level notes get subject `Appunti Generali`.
- `README.md`, `GUIDA.md` and `AGENTS.md` are documentation and excluded from the build.
- The note's title lives in the PDF header, not in the page body. Most notes open at `###` / `####` (`Enunciato`, `Dimostrazione`, ...); some use `##` and two use `# `. That is allowed — it just renders as a heading below the header.
- Only what `header.tex` loads is available: `tcolorbox`, `xcolor`, `fancyhdr`, `fvextra`, `tikz` (`positioning`, `shapes.geometric`, `arrows.meta`). Notes cannot add packages. A macro the notes need but LaTeX lacks gets defined in `header.tex` with `\providecommand` — that is how `\degree` was fixed — rather than by rewriting the note.

## Frontmatter and tagging

A note may open with a three-key YAML block. It is Obsidian metadata: pandoc consumes it and prints nothing into the PDF, so tagging is build-safe.

```yaml
---
id: Puntatori
aliases: []
tags:
  - "#fondamenti_di_informatica"
  - "#università"
  - "#teoria"
  - "#programmazione"
---
```

- `id` must equal the filename stem. `aliases` is a list, `[]` unless the note has Obsidian aliases. `tags` is a block list of double-quoted `#tag` strings with **no spaces** — use `_` (`#fondamenti_di_informatica`). An unquoted `- #tag` line is a YAML *comment*: the tag is dropped silently and the build still passes.
- **Ask before adding a frontmatter block or tags to a note that does not already have them.** Never introduce a YAML block silently. When asked to tag a selected set of notes, tag exactly that set.
- `Fondamenti di Informatica` is the only folder with populated tags — copy its shape. Other folders use `tags: []` or no frontmatter yet; that is not a gap to fix on your own initiative.
- Reuse the existing vocabulary — `#fondamenti_di_informatica`, `#università`, `#teoria`, `#programmazione`, `#codifica_e_rappresentazione`, `#roba_complicata`, `#architettura`, `#logica`, `#variabili`, `#esercizi`, `#lista`, `#puntatori`, `#linked_list` — and coin a new tag only for a topic none of them covers. The subject tag must match the folder.
- Malformed YAML fails the build, not just Obsidian: pandoc exits 64 with `Error parsing YAML metadata`. Keep the block closed with `---`, quote every tag, no tabs.

## What makes the build fail

- **`$$` must be paired and alone on its line, and `createPdf.sh` enforces it.** Outside code fences a `$$` must be the only thing on its line (blockquote markers allowed) and the total count must be even; otherwise the note is counted as failed with `Errore $$: <nota> (spaiati)` or `(incollati al testo (riga N))`. pandoc never reports either case: both exit `0` and produce a silently unreadable PDF — `$$Ciao mondo$$` renders prose as math italic with every space removed, and a dangling `$$` prints a literal `$$`. Fix: `$$` alone on its own line, always in pairs.
- **Inside `$…$` and `$$…$$` pandoc escapes nothing.** `&` -> `! Misplaced alignment tab character &` (legal only inside `align` / `aligned`); `#` -> `! You can't use macro parameter character #' in math mode`. Write `\&` and `\#` there.
- **`\[ … \]` is not math for pandoc.** It becomes literal `[ … ]`: harmless with plain text, `! Missing $ inserted` as soon as the content holds math commands (`\int`, `\frac`, `^`). Use `$$…$$` or a raw `\begin{…}\end{…}` environment.
- **Body text is auto-escaped.** `% & # _ { } ^ ~` in prose are handled by pandoc — do not pre-escape them. A `%` or a `#` at the start of a line survives into the PDF as literal text, and `#tag` in body text is safe: `#` becomes a heading only when a space follows it. Underscores inside a word (`linked_list.c`) stay literal. `~x~` / `~~x~~` is strikethrough markup — the tildes are formatting, not content.
- **Filenames.** The name is pasted into `\newcommand{\headerTitolo}{...}`, so these characters in a name break the build: `& % # _ { } ^` and a lone `$` (verified: `! Misplaced alignment tab character &`, `! File ended while scanning use of \@argdef`, `! Illegal parameter number in definition of \headerTitolo`, `! Missing $ inserted` — the last one reported at `\end{document}`). Paired `$…$` in a name does compile, but there is no reason to use it. Safe: letters, digits, spaces, `( ) , . ' - ~` and accents. Separately, `main` names must be Obsidian-legal: Obsidian forbids `# ^ [ ] |` (and `/ \ :`) in note names, and that constraint is stricter than the build. A rename silently breaks every `[[...]]` link pointing at the note: grep for those links, ask first, and rename on **both** branches so later `main` -> `production` merges do not keep re-creating a rename conflict.
- Malformed YAML frontmatter -> pandoc `Error parsing YAML metadata`, exit 64, note counted as failed.
- Invented macros -> `! Undefined control sequence`. `\usepackage` in a note body -> `! LaTeX Error: Can be used only in preamble`. A `.md` that is empty after preprocessing is skipped (`Salto: <nota> (file vuoto)`) and not counted. A note whose entire body is frontmatter compiles to a 0-byte PDF and is counted as **failed**: `PDF vuoto generato: <nota>`, script exits 1.

## What compiles but silently loses content

- A bare `%` inside math: LaTeX reads it as a comment and eats the rest of the line, closing `$` included. `$p=50%$` renders as `𝑝 = 50`. In a `$$…$$` block it also swallows the line break: `p = 50%` followed by `q = 2` comes out as one run-together line. Write `\%`.
- `%%commento%%` is an Obsidian comment, not a pandoc one: it renders **literally**, so a hidden note becomes visible in the PDF. Same for a `%%` block on its own lines.
- `==evidenziato==` (Obsidian highlight) renders literally, `==` included. Nothing in the vault uses it yet — `==` appears only as `==>` in headings and inside code fences, where it is harmless.
- `[[Nota con|alias]]` keeps only the alias: the target note name disappears from the PDF.
- `Testo[^rif]` with no matching `[^rif]:` definition renders literally as `[^rif]`.
- `![[file.c]]` / `![[image.png]]`: pandoc cannot resolve the resource and substitutes alt text — `>![[if1.c]]` becomes the bare word `if1.c`. C examples live in `Fondamenti di Informatica/Esempi in C/`; inline them in a code fence on `production`. A standard `![alt](fig.png)` with a missing file behaves the same and additionally emits a `Figura N:` caption.
- ` ```mermaid ` blocks emit the source as a code block. Convert to TikZ on `production` using the `terminal`, `process`, `decision`, `arrow` styles already defined in `header.tex`.
- **Callout markers are stripped by `sed` in `createPdf.sh`** with the regex `> ?\[![a-zA-Z0-9_-]+\]`, so a callout becomes a blockquote that `header.tex` renders as a colored box — the type/label is always lost. The type must match that regex or it is not stripped at all: `> [!Esercizio 1]` and `> [!Approfondimento 📌]` (space, emoji, punctuation) leak the raw `[!Tipo]` into the PDF. A foldable `> [!nota]-` leaves a `-` that pandoc turns into a bullet (`• contenuto`). A nested `>> [!esempio]` collapses to a stray `>` line and the inner box is gone. In short: free-form callout types work in Obsidian, but for the build they must be `[a-zA-Z0-9_-]` only — no spaces, no emoji, no nesting.
- Emoji are dropped with `Missing character ... in font` warnings; the build still exits 0.

## Ask before changing what a note says

Mechanical fixes are safe to make on your own initiative: escaping LaTeX characters, pairing `$$`, repairing YAML frontmatter, defining a missing macro in `header.tex`, adjusting how a callout or diagram renders. Ask first when the change touches meaning:

- theorem statements, proofs, definitions and derivations — the `###` / `####` blocks a note is named after;
- deleting or rewriting note content just to make a PDF compile;
- renaming a note: grep for `[[...]]` links pointing at it first, then ask;
- any edit on `production` that changes what the PDF says rather than how it renders.

## Conventions

- Notes are Italian; keep them Italian (`-V lang=it-IT`). Callout types are free-form (`>[!esercizio]`, `>[!esempio]`, ...) and non-standard types work on `main`, but only `[a-zA-Z0-9_-]` types survive the build (see the callout rule above).
- Known LaTeX-hostile residue still on `production`: `![[...]]` in `Fondamenti di Informatica/C.md`, `Liste a puntatori.md`, `Tipi di dato strutturati.md`, and a `mermaid` block in `Fisica 1/Cosa è la Fisica?.md`.
- `GUIDA.md` holds the full contributor/maintainer workflow and checklists (Italian). Where it disagrees with the scripts, trust the scripts.
