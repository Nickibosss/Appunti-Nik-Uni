#programmazione #università #teoria #variabili
Una variabile è semplicemente un *contenitore di informazioni*.

Esistono due tipi:
- Tipi semplici
- Tipi 

I *tipi semplici* sono:
	- **bool** - un termine vero o falso
	- **int** - un numero intero (ricordiamo che il tipo int usa il [[Codifica dei numeri|complemento a 2]])
	- **char** - un carattere
	- **float** - un numero relativo in singola precisione (4 byte)
	- **double** - un numero relativo in doppia precisione (8 byte)


Se voglio sapere quanti bit occupa una variabile posso usare la funzione `sizeof()`.
```c
sizeof(var)
```
`sizeof()` ritorna il numero di byte che occupa l'argomento. 
In questo caso `var` può essere sia un tipo di variabile, sia una variabile stessa.

Possiamo usare due tipi di sintassi per stampare quello che ritorna `sizeof()`
```c
int dimensione_bool = sizeof(bool);
printf("la dimensione di una variabile di tipo bool è: %d byte\n", dimensione_bool);
```
#### Tipo booleano
Il tipo booleano codifica un valore che può essere vero o falso. Codifica `0` se falso e `1` se vero, ed è stato introdotto successivamente al linguaggio [[C]], quindi per utilizzarlo dobbiamo includere la libreria `stdbool.h`.
```c
#include <stdbool.h>
int main(){
	bool piove = false
}
```

#### Char
Una variabile di tipo *char* codifica un carattere. Per identificarlo usiamo `'(carattere)'`.
```c
char carattere = 'v'
```

##
Un tipo di variabile può avere anche dei *quantificatori* o *qualificatori*, cioè:
	- **short**
	- **long**
	- **signed** - il tipo signed viene usato in genere di default dal compilatore.
	- **unsigned** - cioè senza segno.

Abbiamo una [[Traduzione del codice C|libreria]] molto carina che si chiama <limits.h> e dentro questa ci troviamo le dimensioni di tutti i valori possibili dei tipi di variabili e le codifiche sotto forma di macro :).

## Tipi strutturati
Non sono un solo dato, ma una *sequenza* di dati. In questo caso sono dei **vettori**.
