#università #programmazione #variabili 
Può capitare nei nostri problemi che dobbiamo affrontare delle variabili che assumono un numero **finito** di valori. 
In questo caso al posto di usare ad esempio un intero ed assegnare a x valori un significato, esiste un modo più *chiaro* per scrivere questo codice: il tipo **enumerativo**.
Quando lo andiamo a definire andiamo a scrivere *quali* valori può assumere. 
La sintassi tipo è questa:
```C
// definizione
enum meteo {PIOGGIA, SERENO, NUVOLOSO};

// dichiarazione
enum meteo giorno1;
	giorno1 = NUVOLOSO;
```

Il compilatore codifica il tipo enumerativo come un **intero**. Nel nostro caso
```C
PIOGGIA = 0
SERENO = 1
NUVOLOSO = 2
```

Nel nostro codice al posto di comparare il valore possiamo usare direttamente il nome del valore, che viene trattato come *macro*.

Quindi in questo modo:
```C
if (giorno1 = NUVOLOSO) printf("Oggi è Nuvoloso");
```

Analogamente se stampo a video una variabile enumerativa, stamperà il valore codificato.

In questo caso è molto comodo definire una *funzione di valutazione*, che avendo una variabile enumerativa riporta una stringa.
```C
const char* descriviMeteo (enum meteo M){
	switch (m){
		case PIOGGIA:
			return "pioggia";
		case NUVOLOSO:
			return "nuvoloso";
		case SERENO:
			return "sereno";
		default:
			return "valore meteo sconosciuto";
	}
}
```

Molto comoda questa funzione perchè nel caso dovessimo *stampare a video* passiamo la variabile enumerativa all'interno della funzione.

Inoltre in teoria possiamo anche assegnare ad ogni valore un valore **manualmente**. Basta assegnarne uno, e poi i successivi i valori incrementano da quello dell'assegnazione.

```C
enum settimana {lun = 10, mar, mer, gio, ven, sab, dom};

enum settimana g = gio;
printf("%d\n",g); // stampa 13, non 3
```
