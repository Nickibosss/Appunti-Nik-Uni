#università #programmazione #teoria #variabili
Possiamo dichiarare le [[Tipi di variabili|variabili]] sia nel programma principali sia nei sottoprogrammi, ma possono agire soltanto nel *blocco* in cui sono dichiarate, e sempre solo da *istruzioni* che **seguono** la sua dichiarazione.
Questo è regolato dalle regole di **visibilità** della variabile.

Quindi la visibilità è *limitata* al **blocco più interno** in cui si trova. 
- Se una variabile fosse stata dichiarata *all' interno* di una funzione, questa **ha senso** solo in questo.
- Se lavoriamo con blocchi *annidati* dobbiamo fare molto attenzione.
	- Il blocco interno *ha visibilità* verso i più esterni.
	- I blocchi esterno  **non hanno** *visibilità* verso quelli interni.

>[!example] Per riassumere:
>Le variabili dichiarate all'interno del blocco non sono visibili fuori da essi.
>Quello che gestisce la *visibilità* sono le **regole di visibilità**

Più precisamente, all'*uscita* da un blocco, le variabili dichiarate *in esso* vengono **deallocate dalla memoria**, quindi **non esistono più**.

Allo stesso modo *non posso* ri-dichiarare *la stessa* variabile **più di una volta** nello *stesso blocco*(Introducerebbe ambiguità).
Questo però non mi limita da dichiarare una variabile con lo *stesso identificativo* in un blocco **più interno** rispetto a quello in cui viene dichiarata la prima volta.

>[!example] Esempio:
>```c
>int main (){
>int a = 44;
>int a = 10;  // ri-dichiarazione!!
>}
>```
>**non è lecito**
>```c
>int main (){
>int a = 10;
>{
>	int a = 44;
>}
>}
>```
>**é lecito**

Inoltre se scrivo codice di questo tipo:

```c
int main (){

int a = 10;
int b = 3;

{
	int a = 10; // aliasing!!
	b = b + 4;  // visibilità esterna
}

}
```

**è lecito** perché il blocco più interno ha visibilità verso l'esterno (quindi se nel caso superiore *modifico* b, questa modifica sarà riportata anche **all'esterno** del blocco).

Quando dichiaro una variabile *con stesso identificativo* in un blocco interno, ho quello che si chiama **aliasing**, quindi la variabile dichiarata nel blocco più interno *scherma* quella più esterna.

Più in generale le variabili possono essere:
- **locali**, quindi dichiarate all'interno di un blocco.
	- In questo caso seguono la gerarchia dei blocchi per determinare la visibilità.
	- I *parametri formali* della funzione, che sono visibili **solo** *all'interno della funzione*.
- **globali**, quindi dichiarate all'esterno di un blocco, e di conseguenza *visibili in tutti i blocchi*.

Se usiamo la parola chiave `extern` consente di fare riferimento a variabili globali in altre *unità di compilazione*.

Nella risoluzione di esercizi dobbiamo ricordare di **non usare variabili globali per passare parametri alla funzione**