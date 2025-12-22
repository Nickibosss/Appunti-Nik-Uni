Fino ad oggi abbiamo scritto programmi che si interfacciano dal mondo esterno solo *da tastiera*, ma in questo caso ad ogni esecuzione il programma parte **da capo**. (L'allocazione di cui abbiamo parlato *non è persistente*).

Per memorizzare le informazioni in maniera persistente quindi non possiamo usare la *memoria centrale*, ma dobbiamo fare utilizzo della **memoria di massa**, che è gestita dal sistema operativo con il *file system*. 
In questo modo le informazioni sono salvate in *blocchi* autonomi.

Per adesso vedremo il salvataggio di queste informazioni in **file di testo**. 

Volendo lavorare a livelli di astrazione differenti, quello che sappiamo dobbiamo **generizzarlo** per lavorare con i file.
Le funzionalità di input e output da tastiera e a video sono *casi speciali* di interazione con i file.

Piccola parentesi, le funzionalità delle funzioni che stiamo per vedere sono specificate nei *manuali*. Quindi facciamo sempre in modo di confrontarci con la documentazione che abbiamo (*quando si parla di funzioni di libreria*).

In generale quando lavoriamo con i file abbiamo bisogno di due fasi:
- Una fase che associa un **file esterno** al programma.
- Uno *stream* all'interno del programma.
### Apertura di file
La prima funzione è `fopen`.
```C
FILE* in_file;
in_file = fopen("percorso/nomefile.txt", "metodo di accesso");
```

Restituisce un *puntatore a file* che noi utilizziamo per agganciarci a questo file, per poi successivamente fare tutte le operazioni nel caso.
`fopen` apre un file e lo aggiunge ad uno *stream* (il puntatore).

Il metodo di accesso è una stringa che specifica come vogliamo accedere al file: 
- `"r"` lettura
- `"w"` scrittura
	- Quando apro un file in scrittura *se c'è un file già esistente viene sostituito*. Se il file non esista viene *creato*.
- `"a"` scrittura in coda

Non penso sia necessario spiegare un percorso di file.
Ma in ogni caso quando lo specifichiamo è sempre meglio utilizzare un percorso *relativo* (quindi usando la directory del programma come partenza `./`) al posto di un percorso *assoluto* perché altrimenti rende il programma **non portabile** a meno che il percorso assoluto sia **esattamente uguale** in due macchine diverse.

Ricordiamoci di chiudere un file quando abbiamo finito di usarlo con `fclose`:
```C
fclose(in_file);
```

### Lettura da file
Sul puntatore a file possiamo quindi fare *letture* o *scritture*.
Mentre per stdinput usavamo `scanf`, per letture e scritture su file usiamo `fscanf`.
La sintassi è:
```C
fscanf(input_stream, formato, &destinazione);
	  // puntatore a file
```
Quindi per utilizzarlo faremo una cosa del genere:
```C
int tmp;
fscanf(in_file, "%d", &tmp);
char nome[50];
char cognome[50];
int voto;
fscanf(in_file, "%s %s %d", &cognome, &nome, &voto); // posso leggere in più variabili contemporaneamente
```

`fscanf` restituisce il *numero di letture avvenute con successo*. E quando arriva alla fine del file restituisce `EOF` "End Of File" che è un valore speciale (come `NaN`).
Quindi in genere devo fare un controllo del genere:
```C
while (fscanf(in_file, "%d", &tmp) != EOF && i < num_letture){
	v[i] = tmp;
	i++
}
// assumendo che tmp e i sono due interi
```

#### Lettura di un carattere
Se vogliamo leggere *un solo carattere*, usiamo `fgetc`.
```C
fgetc(input_stream);
```
Lo usiamo in questo modo:
```C
char ch = fgetc(in_file);
```

#### Lettura consecutiva
`fread` legge `dim` byte, `n` volte in un `buffer` (magari un vettore di interi)
```C
fread(puntatore_a_buffer, dim, n, input_stream);
```
Come `fscanf`, restituisce il *numero di letture avvenute con successo*, ma non restituisce `EOF` alla fine del file.
Un utilizzo ipotetico sarebbe:
```C
int buffer[5];
fread(buffer, sizeof(int), 5, in_file);
```
### Scrittura su file
Come `printf` abbiamo `fprintf`:
```C
fprintf (output_stream, formato);
		// puntatore a file
```
ATTENZIONE! Per poter scrivere su file dobbiamo usare `"w"` o `"a"`quando usiamo `fopen`.

In pratica il comportamento è *uguale* a `printf` e `scanf`.

