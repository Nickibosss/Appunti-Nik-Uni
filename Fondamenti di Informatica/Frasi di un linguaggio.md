#teoria #programmazione #università
Tutti i linguaggi di programmazione hanno sintassi precisa, le frasi sono di quattro tipologie:
- Dichiarazioni, cioè sono le istruzioni al traduttore, *non vengono tradotte in codice macchina*.
- Istruzioni, che tradotte in codice macchina indicano al processore le operazioni da svolgere.
- Strutture di controllo, che definiscono l'ordine di esecuzione delle istruzioni (if, when, while).
- Frasi di commento, stringhe ignorate dal compilatore che servono al programmatore per rendere il codice più chiaro

### Identificatori
Si usano per attribuire nomi a:
- Variabili
- Costanti
- Etichette
- Tipi definiti dal programmatore
- Funzioni
La lunghezza della sequenza dell'identificatore è illimitata, in genere dobbiamo usare identificatori descrittivi.
Possono essere formati da *lettere, cifre e carattere _* e sonon **case sensitive**
Non possiamo usare come identificatori parole già introdotte dal linguaggio di programmazione.

### Variabili
Le variabili sono *locazioni di memoria* in cui andiamo a conservare il **valore** di un informazione.
Prima di utilizzare una variabile in [[C]] deve essere dichiarata, cioè devo spiegare al processore *di che tipo è la variabile*. [[Tipi di variabili]]
Possiamo usare diversi tipi di variabile, un esempio è **int**.

Quindi
```c
età = 25;
```
Non è una variabile corretta è mi darà come errore *"età undeclared"*.
La sintassi giusta è:
```c
int età = 25;
```
***N.B.
Il compilatore mi darà questo errore una sola volta***

In questo caso ho riservato lo spazio in memoria per una variabile di tipo intero, e allo stesso tempo gli ho assegnato un valore.
Anche la sintassi
```c
int età;
```
è corretta, ma non ho collegato un valore a questa variabile.
Se non ho inizializzato una certa area di memoria non posso essere certo di cosa ci sia, potrebbe esserci qualsiasi valore possibile.
Quindi devo stare attento a *non leggere una variabile prima che venga scritta*.
[[C]] mi permette anche di dichiarare più variabili contemporaneamente, quindi:
```c
int età, età2, età3;
```
Alloca memoria per tre variabili *di tipo int*.

La prima volta che assegnano un valore ad una variabile diciamo che la *inizializziamo*.
Se voglio vedere che valore do a una variabile posso usare `printf` in questo modo:
```c
printf("%d\n", nome_variabile);
```
`%d` si chiama specificatore di variabile, è un segnaposto che viene sostituito da una specifica variabile.

Quando facciamo delle assegnazioni posso indicare che *codifica* voglio utilizzare con dei suffissi o prefissi
- int - Intero con segno - `int a = 32;`
- **unsigned** int - Intero senza segno - u alla fine del numero - `int a = 32u;`
- numero **binario** - Numero in base 2 - 0b prima del numero - `int a = 0b0101;`
- numero **ottale** - Numero in base otto - 0 prima del numero - `int a = 012;`
- numero **esadecimale** - Numero in base 16 - 0x prima del numero - `int a = 0xf4;`