---
id: Architettura a Livelli
aliases: []
tags: []
---

Dobbiamo imparare a vedere il funzionamento dei calcolatori.
Noi precedentemente ci siamo messi ad un **livello superiore** rispetto alla macchina.
Quindi sappiamo che *il linguaggio eseguibile* cambiava da sistema a sistema. Quindi in questo caso la gestione dei *livelli inferiori* viene fatta automaticamente, quindi questa architettura *stratificata* ci permette di scrivere programmi che funzionano in diverse macchine.
Il punto chiave è **capire come sono fatti** i diversi livelli, e *rispetto alla circostanza*, in che livello dobbiamo metterci.

In particolare, in un [[Sistemi di elaborazione|sistema di elaborazione]] il livello più *basso* è quello delle risorse fisiche del sistema, un livello *intermedio* è quello della *gestione* di queste risorse, mentre il più *elevato* è quello **applicativo**.

Questa struttura ci permette di **virtualizzare** queste risorse, cioè fare in modo che un utente applicativo possa accedere ad una risorsa considerandone **solo l'aspetto funzionale**, quindi un utente non deve preoccuparsi della *gestione specifica* della risorsa, ma solo *come utilizzarla*.

Sotto un ipotetica struttura a livelli:
```
┌─────────────────────────────────────────┐      
│                                         │     ▲
│        Applicazioni di utente           │     │
│                                         │     │
│                  ┌──────────────────────┤     │
│                  │                      │     │
│                  │   Software di base   │     │
│                  │                      │     │
├──────────────────┴───┐                  │     │
│                      │                  │     │
│  Sistema Operativo   │                  │     │
│                      │                  │     │
│                 ┌────┴──────────────────┤     │
│                 │                       │     │ Software
│    ┌────────┐   │ API interfaccia I/O   │     │
│    │ Kernel │   │                       │     │
│    └────────┘   ├───────────────────────┤     │
│                 │                       │     │
│                 │   Driver I/O          │     │
│                 │                       │     │
├─────────────────┴───────────────┐       │     │
│                                 │       │     │
│   Hardware Abstraction Layer    │       │     │
│              (HAL)              │       │     ▼
├───────────┬───────────────┬─────┴───────┤ - - - - - - - - - - - - -    
│           │               │             │     ▲
│  Memorie  │   Processori  │  I/O        │     │
│           │               │             │     │
├───────────┴───────────────┴─────────────┤     │ Hardware
│                                         │     │
│       Sistemi di interconnessione       │     │
│                                         │     ▼
└─────────────────────────────────────────┘      
```

- L'interazione tra il lato *software* e l'*hardware* della macchina è gestito dall'**HAL**, che fornisce all programmatore gli strumenti per *interfacciarsi* con l'hardware, sia fisico, sia ai sistemi di **Input/Output** (**I/O**).
	- In questo modo posso usare software di controllo, i **driver**, per **virtualizzare** i sistemi di **I/O**, in questo caso abbiamo anche un'astrazione di livello superiore, la API dell'interfaccia I/O.
- Il **sistema operativo** è un software di livello di astrazione superiore, che utilizza gli *strati inferiori* per gestire le **risorse di sistema**, consentendo all'utente di *utilizzare e monitorare* le risorse.
- Il **Kernel** (come *Linux*, *Windows NT Kernel*, *XNU* o *FreeBSD*) contiene le **funzioni essenziali** per la gestione delle attività di elaborazione e memorizzazione del sistema operativo.
	- Questo permette ai programmi di accedere alle risorse di base tramite *System Calls*, senza dover badare ai dettagli architetturali e di programmazione della risorsa fisica.
- Il **Software di base** è un insieme di programmi che usando *sistema operativo* e *driver* per fornire all'utente funzionalità per la gestione dei livelli inferiori, e per lo sviluppo di applicazioni di utente.

Quindi tutto questo serve a fare in modo che i livelli superiori non debbano preoccuparsi dei dettagli **fisici e applicativi** delle risorse di base del macchinario, ma possono accedere a queste risorse *in maniera semplificata*. 


> [!EXAMPLE] Esempio
> Se voglio scrivere un programma semplice per scrivere e stampare un documento, non voglio preoccuparmi dei dettagli su *come funziona la memoria del mio macchinario*, *come funziona il processore del macchinario*, *come funzionano i dispositivi di connessione alla stampante* e *come la stampante si aspetta di ricevere quello che deve stampare*.
