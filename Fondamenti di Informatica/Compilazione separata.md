Abbiamo già parlato della pipeline di [[Traduzione del codice C|compilazione]] in [[C]].
Nulla ci dice che il linker non vada a collegare un file *scritto da noi*.

Parliamo di [[Progettazione e modularità|programmazione modulare]], ma questo in genere ci serve se affrontiamo problemi *più complicati* di quelli di questo corso.

Quindi è conveniente dividere il codice in più file per diversi motivi:
- Organizzazione migliore
- Più facile da mantenere
- Possiamo riutilizzare codice più volte

Il modulo principale è il celeberrimo `main`, che è il *punto di ingresso* del programma, e deve esisterne solo **uno**. Nel file principale possiamo andare ad includere diverse *librerie* in testa al file.

Lo facciamo con `#include`, ma in maniera più precisa abbiamo due sintassi diverse:
```C
#include <nome_libreria.h> // se la libreria è nella directory default 
#include "percorso_libreria.h" // de devo trovare la libreria
#include "percorso_codice_sorgente.c" // posso includere un file sorgente
```

Ovviamente la soluzione più semplice è includere del *codice sorgente*, ma non è molto efficiente.

In questo caso non vado a modificare la compilazione (il comando rimane uguale):
```
gcc main.c -o main.exe
```

Attenzione che in questo caso il compilatore **incolla** il contenuto del file dove abbiamo scritto `#include`.
Ripeto come dentro ai file inclusi **non possono esserci funzioni *main***.
Quindi non parliamo strettamente di *compilazione separata*, ma faccio una compilazione "monolitica".

Quando usiamo e definiamo le librerie è buona norma strutturare il programma in *tre file*:
- Un file **header** (.h) che contiene
	- dichiarazioni di *variabili globali*, *costanti* e *tipi*.
	- le dichiarazioni dei *prototipi di funzioni*.
- Un file **di implementazione** (.c) che contiene le *implementazioni* delle funzioni
	- Questo file deve contenere anch'esso il *file header* della libreria
- Il file **principale** (.c) che contiene il *main*.

In questo caso effettivamente dobbiamo modificare il processo di compilazione:
```
gcc -c mylib.c
gcc -c main.c
gcc -o main main.o mylib.o 
```

Chiamare il comando `gcc -o` invoca il *linker*, e ci permette di modificare il main senza dover ricompilare le librerie.

Nota come devo fare una cosa molto carina e compilare *prima le librerie*.

Dato che è un processo lungo e, francamente, una perdita di tempo, i programmatori usano quello che si chiama un *makefile*.

[aggiorno asap]

Segue esempio con libreria:
##### mylib.h
```C
void incr(int *acc, int n);
```

##### mylib.c
```C
#include "mylib.h"

void incr(int * acc,  int n){
    *acc = n+*acc;
}
```

##### main.c
```C
#include <stdio.h>
#include "mylib.h"

int main(){
    int n = 1;
    for (int i=0; i<10; i++){
        incr(&n, 12);
        printf("%d", n);
    }
}
```