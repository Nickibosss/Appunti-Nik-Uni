---
id: Strutture di controllo
aliases: []
tags:
  - #università #programmazione #teoria
---

Abbiamo a che fare con *paradigmi* che definiscono i modelli adottati da un certo linguaggio di programmazione.

In generale il nostro programma si definisce da *dati* e *flusso di controllo*.

Quindi per scrivere un programma abbiamo bisogno di solo tre costrutti:
- Strutture di sequenza.
- Strutture di selezione.
- Strutture di iterazione.

Per scrivere un programma in grado di eseguire diversi *flussi di esecuzione* rispetto ad alcune conduzioni.

### Controllo del flusso di esecuzione
Iniziamo a guardare il *costrutto di selezione* `if`.

Con il costrutto `if` il suo *corpo* viene eseguito **solo se** la condizione associata assume un valore `true`.  Altrimenti il corpo viene *saltato*.

La sintassi del costrutto `if` in [[C]] è:
```c
if (condizione){
	*corpo dell'if*
}
```

>[!exercise] Facciamo questo esercizio
>"Progetta e scrivi un programma che inserito un numero, se è maggiore di 10 lo stampa a video."

Il *flusso di esecuzione* quindi segue questo diagramma:

\begin{center}
\begin{tikzpicture}[node distance=1.5cm and 2cm, auto]
    % Spina dorsale centrale
    \node [terminal] (A) {prima};
    \node [decision, below=of A] (B) {if};
    \node [terminal, below=of B] (D) {dopo};
    
    % Nodi laterali
    \node [process, right=of B] (C) {blocco if};

    \draw [arrow] (A) -- (B);
    \draw [arrow] (B) -- node[above] {TRUE} (C);
    \draw [arrow] (B) -- node[right] {FALSE} (D); % Percorso diretto (falso)
    \draw [arrow] (C) |- (D);
\end{tikzpicture}
\end{center}

Nella versione base se la condizione è `false` l'esecuzione salta il corpo dell'*if*.
Per eseguire *blocco* nel caso della condizione falsa introduco il costrutto `if-else`.

I due *corpi*, data la natura bistabile del booleano, sono **mutualmente esclusivi**.

La sintassi del costrutto `if-else` in C è:
```c
if (condizione){
	*corpo if*
}
else{
	*corpo else*
}
```

>[!exercise] Facciamo questo esercizio
>"Progetta e scrivi un programma che inserito un numero intero, stampa a video se è maggiore oppure minore o uguale di 10

Il *flusso di esecuzione* quindi segue questo diagramma:

\begin{center}
\begin{tikzpicture}[node distance=1.5cm and 0.5cm, auto]
    % Spina dorsale centrale
    \node [terminal] (A) {prima};
    \node [decision, below=of A] (B) {if};
    \node [terminal, below=3.5cm of B] (E) {dopo};

    % Nodi laterali
    \node [process, below left=1cm and 0.5cm of B] (C) {braccio then};
    \node [process, below right=1cm and 0.5cm of B] (D) {braccio else};

    % Frecce
    \draw [arrow] (A) -- (B);
    \draw [arrow] (B) -| node[above left] {TRUE} (C);
    \draw [arrow] (B) -| node[above right] {FALSE} (D);
    \draw [arrow] (C) |- (E);
    \draw [arrow] (D) |- (E);
\end{tikzpicture}
\end{center}

Per evitare *indentazioni* eccessive posso usare una sintassi di questo tipo:
```c
if (condizione){
	*corpo if*
} else if (condizione2){
	*corpo else if*
} else{
	*corpo else else*
}
```

L'ultimo costrutto di selezione che dobbiamo vedere è il costrutto `switch-case`.
Questo costrutto fa la stessa cosa che facciamo con `if-else` ma in maniera diversa.
La sintassi è:
```c
switch(selettore){
	case cost1:
		*corpo*
		break;
	case cost2:
		*corpo*
		break;
	default:
		*finale*;
}
```

Lo `switch` calcola il valore dell'espressione `selettore` e rimanda lo svolgimento del programma al blocco con costante **uguale** al risultato.

Ricordiamo che nello `switch case` i blocchi non sono mutualmente esclusivi.

#### Strutture di controllo iterative.
Con una struttura di controllo iterativa si *ripete l'esecuzione* di un blocco di istruzioni $n$ volte.

Costrutto `while`.

Nel costrutto `while` l'esecuzione del *corpo while* viene ripetuta finchè la **condizione** è `true`.
La sua sintassi è:
```c
while (condizione){
	<corpo while>
}
```
Dobbiamo ricordare che è necessara una **condizione di terminazione**, altrimenti l'esecuzione ripete infinitamente.

Il flusso di esecuzione è quindi:

\begin{center}
\begin{tikzpicture}[node distance=1.2cm and 2cm, auto]
    % Spina dorsale centrale (tutti allineati)
    \node [terminal] (A) {prima};
    \node [decision, below=of A] (B) {while};
    \node [process, below=of B] (C) {corpo while};
    \node [terminal, below=of C] (D) {dopo};

    % Frecce
    \draw [arrow] (A) -- (B);
    \draw [arrow] (B) -- node[right] {true} (C);
    
    % Loop (passa a sinistra)
    \draw [arrow] (C.west) -- ++(-1.5,0) |- (B.west);
    
    % Uscita dal loop (salta il corpo, passa a destra)
    \draw [arrow] (B.east) -- node[above] {false} ++(1.5,0) |- (D.east);
\end{tikzpicture}
\end{center}

>[!excercise] Facciamo questo esercizio
>Progettare e scrivere un programma che prenda in ingresso un numero intero n e stampi la tabellina del numero inserito.

Costrutto `do-while`.
Il costrutto è molto simile al costrutto `while`, ma esegue sempre il *corpo do*, prima di **valutare la condizione**.

La sintassi è di tipo:
```c
do {
<corpo do>
}
while (condizione);
```

Il flusso di esecuzione è:

\begin{center}
\begin{tikzpicture}[node distance=1.2cm and 2cm, auto]
    % Spina dorsale centrale (tutti allineati)
    \node [terminal] (A) {prima};
    \node [process, below=of A] (B) {corpo do};
    \node [decision, below=of B] (C) {condizione};
    \node [terminal, below=of C] (D) {dopo};

    % Frecce
    \draw [arrow] (A) -- (B);
    \draw [arrow] (B) -- (C);
    \draw [arrow] (C) -- node[right] {false} (D);
    
    % Loop (torna indietro, passa a destra)
    \draw [arrow] (C.east) -- ++(1.5,0) node[above, pos=0.5]{true} |- (B.east);
\end{tikzpicture}
\end{center}

>[!esercizio] Facciamo questo esercizio
>Progetta e scrivi un programma che richiede all'utente l'inserimento di un intero fintantoché il valore inserito non rientra nell'intervallo `[1.12]`.


Costrutto `for`:
Usiamo il costrutto `for` per eseguire un blocco *n* volte. Contienoe una **inizializzazione**, **condizione** e **aggiornamento**.

La sintassi è del tipo:
```C
for(inizializzazione; condizione; aggiornamento){
	<corpo del for>
}
```
Mentre l'inizializzazione viene eseguita solo una volta all'inizio del ciclo, l'aggiornamento si esegue alla fine del ciclo, poi valutata la condizione.

Il flusso di esecuzione è quindi:

\begin{center}
\begin{tikzpicture}[node distance=1cm and 2cm, auto]
    % Spina dorsale centrale (tutti allineati)
    \node [terminal] (A) {prima};
    \node [process, below=of A] (B) {inizializzazione};
    \node [decision, below=of B] (C) {condizione};
    \node [process, below=of C] (D) {corpo for};
    \node [process, below=of D] (E) {aggiornamento};
    \node [terminal, below=of E] (F) {dopo};

    % Frecce
    \draw [arrow] (A) -- (B);
    \draw [arrow] (B) -- (C);
    \draw [arrow] (C) -- node[right] {true} (D);
    \draw [arrow] (D) -- (E);
    
    % Ritorno all'inizio del ciclo (passa a sinistra)
    \draw [arrow] (E.west) -- ++(-1.5,0) |- (C.west);
    
    % Uscita dal ciclo (salta il corpo, passa a destra)
    \draw [arrow] (C.east) -- node[above] {false} ++(1.5,0) |- (F.east);
\end{tikzpicture}
\end{center}
