---
id: Sistemi basati su componenti programmabili
aliases:
  - componenti programmabili
  - sistemi programmabili
tags: []
---

Possiamo restringere la definizione generale di [[Sistemi|sistema]] applicando una [[Architettura Gerarchica|scomposizione gerarchica]] opportuna. 
Definiamo dunque [[Sistemi|sistema]] un insieme di $N \text{ con } N\geq 1$ **Processing Element** (o **PE**) opportunatamente connessi *tra di loro e con il mondo esterno* da $M \text{ con } M\geq 1$ **Sottosistemi** (o **reti**) **di Interconnessione**.

A loro volta sia i *PE* che i *Sottosistemi di Interconnessione* sono realizzati da un insieme di **Componenti** (o **Dispositivi** o **Blocchi Funzionali**), ciascuno dedicato a svolgere un *determinato insieme di funzioni*.


> [!IMPORTANT] Attenzione!
> Usiamo **PE** specificamente perchè i suoi sinonimi italiani (come CPU, o Processore, o Calcolatore Elettronico) hanno assunto significato specifico diverso. 
> In ogni caso possiamo (per adesso) dire che un **PE** è un *Processore*.
