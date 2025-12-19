#teoria #programmazione #università 
Programmare significa scrivere in uno specifico linguaggio di programmazione un algoritmo capace di risolvere un problema
Un linguaggio di programmazione prevede un certo tipo di regole che dobbiamo conoscere per programmare.
Importante ricordare che il codice [[C]] che scriviamo non viene capito direttamente dal processore ma c'è bisogno di una traduzione in linguaggio macchina.
Cosa molto ottima è che non dobbiamo farlo a mano ma esiste un programma che prende il codice di *alto livello* e lo trascrive in codice di *basso livello*.
Il potere descrittivo di un codice di basso livello è molto inferiore di quello di un codice di alto livello.

## Primo programma

``` C
// Programma C
#include <stdio.h>
 
int main(){
	printf("hello world\n");
	return 0;
}
```

La riga // Programma C viene chiamato **commento** 

Possono essere di due tipi:
``` C
// Questo commento è una sola riga
questo non è un commento
/*
questo è un commento su due righe
anche questo è un commento su due righe
*/
questo, invece non è più un commento
```

Le righe hanno lunghezza infinita, però ovviamente è più leggibile andare da capo se voglio fare un commento più lungo
Posso scrivere le mie [[Istruzioni]] su una sola riga ma per prassi mi conviene scrivere codice su più righe.
Come regola mi interessa  rendere il codice leggibile in una sola schermata

la riga `#include<stdio.h>` viene chiamata direttiva del precompilatore.
Serve al compilatore a capire che nel mio codice voglio usare dei meccanismi che non devo necessariamente definire nel mio programma.
Utilizzo queste librerie per utilizzare funzioni standard, contenute appunto nelle librerie.

Le parentesi angolari  (<>)  servono a definire un file nel percorso standard, in cui l'ambiente si aspetta si trovino le librerie.
Quindi mi servono per non specificare il filepath.
Se questa libreria non si trova in questo percorso standard.

Nella riga `printf("Hello world\n");` ho la *funzione* `printf` e l'*argomento* `"Hello world\n"` che chiamiamo stringa.
Il punto e virgola alla fine della stringa indica che l'istruzione è terminata, se lo dimenticassi, il [[Traduzione del codice C|compilatore]]  non può completare la compilazione

`int` prima di `main` significa che dalla funzione main il sistema si aspetta un valore intero.
Per convenzione se restituisce `0` significa che la funzione non ha errori, mentre se restituisse un altro valore restituirebbe un valore diverso.
Questo valore lo restituisco nella line `return 0`

Se non rispetto le convenzioni del linguaggio [[C]] la compilazione si interrompe, e mi tira un errore.

### Tipi di errori
Esistono due tipi di errori:
- errori di compilazione
- errori in runtime

## 
Ovviamente per andare a programmare dobbiamo sapere che tipo di *problema* dobbiamo risolvere, le strategie su *come* risolverlo e poi successivamente andare a controllare.

Gli elementi principali che andiamo a toccare sono:
### [[Tipi di variabili|Dati]]
- tipi *semplici*
- tipi *[[Tipi di dato strutturati|strutturati]]*

### [[Strutture di controllo]]
- *sequenza*
- *selezione*
- costrutto *iterativo*

Questi costrutti sono gli **unici** di cui abbiamo bisogno in *qualsiasi* linguaggio di programmazione, noi lavoreremo specificamente in questo corso li affronteremo in **C**.

### [[Progettazione e modularità]]
