Una lista a puntatori (*linked list*) è un altro modo per **gestire la memoria**.

Fino ad ora abbiamo visto che possiamo allocare array sia sullo **stack** che in **area heap**
Ovviamente solo se allochiamo in area heap possiamo fare questa cosa in maniera *dinamica*. 

Però questa operazione è abbastanza complicata da gestire.

Usare una lista a puntatori ci risolve il problema dell'allocazione alla memoria *limitandola* a quella strettamente necessaria.

Il principio fondamentale è allocare una lista come un **insieme di nodi**. Quindi ogni volta che andiamo a memorizzare un elemento andiamo ad *allocarne lo spazio* (del singolo elemento!).
Quindi riservo lo spazio **informazione per informazione**.

La differenza principale con l'allocazione di un array è che necessariamente non siamo sicuri che occupino locazioni di memoria *contigue*.
Per rimediare, insieme all'informazione, mi riservo lo spazio per un **puntatore** che punta al **prossimo elemento**. 

Esempio:
```C
struct elemento{
	int valore;
	struct elemento *prossimo; // puntatore alla prossima struttura di dati
};

struct elemento *lista= malloc(sizeof(struct elemento)); // riserva spazio e restituisce indirizzo
```
In questo caso ho creato una lista con un solo elemento. Per accedere al valore del primo nodo posso tranquillamente fare qualcosa di questo genere.
```C
lista->valore=4;
```

Quindi in questo modo possiamo tranquillamente portarci al *prossimo elemento della lista*.

Ogni volta che andiamo ad allocare un *nuovo nodo* dobbiamo occuparci di gestire questa **catena**. 

> [!tip] N.B.
> Un puntatore non inizializzato porta a `NULL` (`0`).

ATTENZIONE AI `TYPEDEF`. Molto spesso si usano per rendere il codice più semplice da leggere.

Data la catena, posso navigare **tutti** i nodi della lista partendo dal *primo elemento*.
Quindi dalla parte implementativa, per me la lista potrebbe essere benissimo un *puntatore* al primo elemento.
Ovviamente se perdo `lista` non so più dove si trova la mia lista.

Se voglio memorizzare altri valori, mi basta invocare di nuovo `malloc`:
```C
lista->prossimo = malloc(sizeof(struct elemento));
lista->prossimo->valore = 5;
```
In questo modo ho realizzato la **concatenazione**. 
- Qui è molto evidente l'utilità della notazione con frecce.

Dal punto di vista pratico basta ricordare questo contesto. Da queste assunzioni possiamo prendere diverse elaborazioni:
- `lista = NULL` significa che ho una lista vuota.
- `lista->prossimo = NULL` significa che ho un solo elemento nella lista.
- Quando raggiungo un elemento con un puntatore `NULL` ho raggiunto la fine della lista.

In questo modo posso ricavare un bel po di algoritmi.
### Aggiunta di un elemento
Algoritmo in italiano:
Partendo dalla testa della lista, scorro gli elementi finchè trovo un elemento con puntatore pari a `NULL`. Quando lo trovo vado a sostituire il valore del puntatore con un allocazione `malloc`. Inserisco il valore che mi serve nell'elemento e devo **ricordare di portare il suo puntatore a `null`**. 
Dalla parte implementativa uso una copia del *puntatore alla testa* per scorrere la lista.

Esempio
```C
lista->prossimo->prossimo = malloc(sizeof(struct elemento));
lista->prossimo->prossimo->valore = 7;
lista->prossimo->prossimo->prossimo = NULL;
```

### Eliminazione di un elemento
Algoritmo in italiano.
Dato che non mi interessa che siano contigue le locazioni di memoria, basta connettere puntare il puntatore del nodo *precedente* a quello *successivo*.
Devo poi **deallocare** l'area di memoria del nodo che voglio cancellare.

Se devo deallocare *tutta la struttura dati*, devo procedere dalla coda alla testa.

### Visualizzazione della lista
```C
struct elemento *p = lista;
whille(p!=NULL){
	printf("%d", p->valore);
	p=p->prossimo;
}
```
Uso una copia del puntatore perché se modifico `lista` non posso più trovare la lista, accedere ai suoi nodi o deallocarne lo spazio.

