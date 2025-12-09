Inizio scrivendo un piccolo programma per ricordare il limite massimo e minimo di *int* e *unsigned int*.
```c
#include<stdio.h>
#include<limits.h>

int main(){
	printf("min = %d - max = %d", INT_MIN, INT_MAX);
	printf("u min = 0 - u max = %u", UINT_MAX);
}
```
che come output da 
```c
min = -2147483648 - max = 2147483647
u min = 0 - u max = 4294967295
```

A questo punto posso andare a scrivere il programma descritto dalla consegna;
```c
#include <stdio.h>

int N1, N2, N3;
unsigned int U1, U2, U3;

int main(){

    N1 = 2000000000; // Numero vicino ai limiti dell'intervallo rappresentabile
    N2 = 200000000;  // Numero che addizionato a N1 mi da un risultato al di fuor
    N3 = N1 + N2;    // Sommo le due variabili
    
    printf("Operazione int\n%d + %d = %d\n",N1, N2, N3);
	
    U1 = 0;          // Minimo della rappresentazione
    U2 = 10;
    U3 = U1 - U2;    // Sottraggo un numero al minimo dell'intervallo rappresenta
	
    printf("Operazione unsigned int\n%u - %u = %u\n", U1, U2, U3);
}
```

L'output che ottengo è:
```c
Operazione int
2000000000 + 200000000 = -2094967296
Operazione unsigned int
0 - 10 = 4294967286
```

Noto immediatamente che l'operazione non ha il risultato che mi aspettavo.

Questo perché vado ad incorrere nella condizione di *overflow*.
Ricordiamo come la rappresentazione dei numeri con un numero fisso di bit è ciclica. Questo significa che se un operazione porterebbe fuori all'*intervallo rappresentabile*, mi ritrovo dal lato opposto dell'intervallo, questo è il fenomeno dell'errore di *wrap around*.
Infatti possiamo notare che in entrambi i casi la differenza tra il valore *aspettato* e il limite attraversato, e il valore *ottenuto* e il limite opposto è **uguale**.
$$
\text{intervallo =} [0 , 4294967295]
$$
$$
10-1 = 9
$$
$$
4294967295 - 4294967286 = 9
$$
Nel caso del valore **unsigned int** è molto più facile da verificare dato che il "resto" che abbiamo è molto più piccolo, ma la stessa cosa vale anche con il valore **int**.

Questo succede ovviamente in entrambi i limiti dell'intervallo rappresentabile, come si vede da questo codice:
```c
#include <stdio.h>

int N1, N2, N3;
unsigned int U1, U2, U3;

int main(){

    N1 = 2000000000; // Numero vicino ai limiti dell'intervallo rappresentabile
    N2 = 200000000;  // Numero che addizionato a N1 mi da un risultato al di fuor
    N3 = N1 + N2;    // Sommo le due variabili
    
    printf("Operazione int\n%d + %d = %d\n",N1, N2, N3);
    
    N1 = -2000000000;// Numero vicino ai limiti dell'intervallo rappresentabile
    N2 = 200000000;  // Numero che sottratto a N1 mi da un risultato al di fuori 
    N3 = N1 - N2;    // Sommo le due variabili
    
    printf("Operazione int 2\n%d + %d = %d\n",N1, N2, N3);
	
    U1 = 0;          // Limite inferiore dell'intervallo rappresentabile
    U2 = 10;
    U3 = U1 - U2;
	
    printf("Operazione unsigned int\n%u - %u = %u\n", U1, U2, U3);
	
    U1 = 4294967295; // Limite superiore dell'intervallo rappresentabile
    U2 = 10;
    U3 = U1 + U2;
	
    printf("Operazione unsigned int 2\n%u + %u = %u\n", U1, U2, U3);

}

```
Che da come output:
```c
Operazione int
2000000000 + 200000000 = -2094967296
Operazione int 2
-2000000000 + 200000000 = 2094967296
Operazione unsigned int
0 - 10 = 4294967286
Operazione unsigned int 2
4294967295 + 10 = 9
```
Quindi possiamo notare appunto che l'overflow accade in tutti e due i "versi".

Un altra cosa che possiamo notare è che se stampo i valori del *signed interger* se trattati come *int* usando `%d`, date le proprietà della rappresentazione in complemento a 2 usata da **C**, danno il risultato che ci aspettiamo nella prima operazione unsigned, mentre nella seconda abbiamo un risultato inaspettato:
```c
Operazione unsigned int
0 - 10 = -10
Operazione unsigned int
-1 - 10 = 9
```
Questo perché la codifica binaria del numero `4294967295` è `11111111111111111111111111111111` codifica che corrisponde alla rappresentazione di `-1` in complemento a 2, cosa che non succede nel primo caso perché le rappresentazioni dei numeri da `0` a 2<sup>l-1</sup> sono equivalenti.
