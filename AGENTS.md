# AGENTS.md

Obsidian markdown notes vault (university lectures, Italian). Not a software project: the only build is markdown -> PDF via pandoc + lualatex.

## Two branches — the thing to get right first

- `main`: notes in natural Obsidian markdown (callout, `mermaid`, `![[embeds]]`, wikilinks). All content work happens here.
- `production`: the same notes adapted so they compile as LaTeX. Releases/tags (`Beta-*`) are cut **here**, so CI builds production's files.
- Never push to either. Branch + PR: content PRs target `main`; PRs that only fix compilation branch from and target `production`. Do not pre-translate content PRs into LaTeX.
- `production` lags `main`: it still carries the pre-refactor `createPdf.sh` (writes `temp.md` and `meta.tex` into the repo root, never exits non-zero, and its `find` does not exclude `./pdf/`, so a second run recompiles the `_Markdown` copies recursively) and has no `.gitignore`. Merge `main` -> `production` before relying on newer script behaviour.

## Where compilation actually matters

`./createPdf.sh` must exit `0` on **`production`**: releases are cut there and the workflow publishes whatever compiles, so a failing note means a missing PDF in the release. On `main` a non-zero exit is **not** mandatory and not a blocker for a content PR — notes there are still in Obsidian form. Run the build on `main` to learn what will break later, not as a gate.

When a note fails on `production`, fix it in the least destructive order: a `header.tex` definition -> a markdown syntax fix -> ask the maintainer before touching the note's content or renaming a file. Shared fixes in `header.tex` travel with the `main` -> `production` merge; edits to a single note do not help other notes.

## Verification

- Full build, from the repo root (the folder that holds `header.tex`): `./createPdf.sh` then `echo $?` — `0` all notes compiled, `1` at least one failed. Takes minutes (lualatex is ~3-4s per note).
- Fast single-note check. It needs the two header macros or it dies with `! Undefined control sequence`:

  ```bash
  printf '\\newcommand{\\headerTitolo}{Legge oraria}\n\\newcommand{\\headerMateria}{Fisica 1}\n' > /tmp/m.tex
  pandoc - -f markdown+wikilinks_title_after_pipe+hard_line_breaks --pdf-engine=lualatex \
    -V lang=it-IT -H /tmp/m.tex -H header.tex -o /tmp/nota.pdf < "Fisica 1/Legge oraria.md"
  ```

- `./zipFolders.sh` only **after** `createPdf.sh` (it errors if `pdf/` is missing).
- CI (`.forgejo/workflows/pdf-convert.yaml`) triggers only on `release: published` and `workflow_dispatch`. It never validates a push or a PR — the local build is the test.
- Local pandoc is 3.11, CI pins 3.1.13. `--highlight-style` prints a deprecation warning on newer pandoc: a warning is not a failure.

## Build facts that change how you edit a note

- pandoc input is `markdown+wikilinks_title_after_pipe+hard_line_breaks`: single newlines in the source become hard line breaks in the PDF. Reflowing or joining source lines changes PDF layout.
- One folder = one subject; the folder name goes in the PDF header left, the file name goes header right and becomes the PDF's name. Root-level notes get subject `Appunti Generali`.
- `README.md`, `GUIDA.md` and `AGENTS.md` are documentation and excluded from the build.
- Notes have no `# H1`: the title lives in the PDF header, and notes open straight at `###` / `####` section headings (`Enunciato`, `Dimostrazione`, ...).
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

- `$$` must be alone on its own line and paired; text on the same line -> `! Undefined control sequence`.
- Unescaped `% & # _ $ { } ^ ~ \` in body text -> escape them.
- The filename goes into `\newcommand{\headerTitolo}{...}`, so those same characters in a **filename** break the header (`! Missing $ inserted`, reported at `\end{document}`). Avoid them in new note names. An existing note that fails this way needs a rename, and a rename silently breaks every `[[...]]` link pointing at it — grep for those links and ask before renaming.
- Malformed YAML frontmatter -> pandoc `Error parsing YAML metadata`, exit 64, note counted as failed.
- Invented macros -> `! Undefined control sequence`. An empty `.md` is skipped; a 0-byte PDF counts as a failure.

## What compiles but silently loses content

- `![[file.c]]` / `![[image.png]]`: pandoc cannot resolve the resource and substitutes alt text. C examples live in `Fondamenti di Informatica/Esempi in C/`; inline them in a code fence on `production`.
- ` ```mermaid ` blocks emit the source as a code block. Convert to TikZ on `production` using the `terminal`, `process`, `decision`, `arrow` styles already defined in `header.tex`.
- `>[!type]` callout markers are stripped by `sed` in `createPdf.sh`, so the callout becomes a blockquote that `header.tex` renders as a colored box — the type/label is lost, and foldable `>[!note]-` leaves a stray `-`.
- Emoji are dropped with `Missing character ... in font` warnings; the build still exits 0.

## Ask before changing what a note says

Mechanical fixes are safe to make on your own initiative: escaping LaTeX characters, pairing `$$`, repairing YAML frontmatter, defining a missing macro in `header.tex`, adjusting how a callout or diagram renders. Ask first when the change touches meaning:

- theorem statements, proofs, definitions and derivations — the `###` / `####` blocks a note is named after;
- deleting or rewriting note content just to make a PDF compile;
- renaming a note: grep for `[[...]]` links pointing at it first, then ask;
- any edit on `production` that changes what the PDF says rather than how it renders.

## Conventions

- Notes are Italian; keep them Italian (`-V lang=it-IT`). Callout types are free-form (`>[!esercizio]`, `>[!esempio]`, ...) and non-standard types work on `main`.
- Known LaTeX-hostile residue still on `production`: `![[...]]` in `Fondamenti di Informatica/C.md`, `Liste a puntatori.md`, `Tipi di dato strutturati.md`, and a `mermaid` block in `Fisica 1/Cosa è la Fisica?.md`.
- `GUIDA.md` holds the full contributor/maintainer workflow and checklists (Italian). Where it disagrees with the scripts, trust the scripts.
