#programmazione #università #teoria 
Quando parliamo di dati strutturati possiamo parlare di dati strutturati *omogenei* oppure *eterogenei*.
La tipologia più semplice sono array.
## Array
Un array e in insieme di oggetti *omogeneo*. Quindi contiene una sequenza di dati dello stesso tipo.
Un array immagazina informazioni in locazioni di memoria **consecutive**. Quindi per il compilatore dobbiamo sapere la *dimensione* dell'array, cioè il numero di unità atomiche che sono interne ad un array.
Dichiaro un array in questo modo:
```C
tipo nome_array[dimensione];
```

Dobbiamo tenere a mente che (*in generale*) dobbiamo conoscere la dimensione dell'array al momento della **compilazione**.

Inoltre dobbiamo assicurarci di *scrivere* dei valori alle locazioni di memoria riservate dal compilatore.

>[!esempio] Esempio 
>```C
>int vettore[5]; // Questa istruzione ci ha permesso di andare a 
>                   // dichiarare una variaible di tipo array, che contiene 5 elementi int
>int numeri[5] = {12, 5, 33, 23, 50}; // Così ho inizializzato l'array
>									    //posso fare questo solo alla 
>									     // dichiarazione.
>```

Per accedere ad un valore nell'array devo usare l'**indice** dell'elemento. Questi indici iniziano da `0` e arrivano a uno meno la dimensione dell'array.

Nel codice accedo all'elemento in questo modo:
```C
nome_array[*indice variabile*];
```

>[!tip] NB
>Al posto di usare un numero posso passare dentro al campo *indice variabile* una variabile.

Posso usare questa sintassi sia in **lettura** che in **scrittura**.
>[!esempio] Esempio:
>```C
>int numeri[5] = {12, 5, 33, 23, 50};
>int numero3 = numeri[2];
>numeri[1] = 12;
>```

Attenzione: se cerco di accedere ad un indice *superiore* agli elementi dell'array, il programma in esecuzione scrive a locazioni di memoria esterne a quelle riservate all'array. In questo caso si parla di errore di **segmentation fault**.
Con `gcc` il mio sistema operativo potrebbe darci un bell'errore del tipo `*** stack smashing detected ***: terminated` (ma *non ci da errore* **alla compilazione**).

Può succedere che non so a priori quanti elementi effettivi devo inserire in un array, in questo caso dichiaro un array con dimensione pari a quanti elementi oc78correrebbero nel *caso peggiore*, e popolo l'array con una variabile che chiamo di **riempimento**.

### Gestione di array con variabile di riempimento
Uso la variabile di riempimento per gestire i valori che *posso utilizzare* nell'array.

In genere, con la variabile di riempimento, inizializzo l'area di inserimenti nel vettore in maniera sequenziale.
In questo modo posso leggere la variabile di riempimento in due modi:
- La quantità di elementi nell'array.
- L'indice dell'ultimo elemento **utile** dell'array.
Questo ci permette di fare tante cose di ottimizzazione, e evitare errori.

In pratica delego la gestione dell'array con la variabile di riempimento ad una funzione a parte, che si occupa di *incrementare* la variabile di riempimento ed *inserire* i nostri dati nell'array.







Sotto alcuni algoritmi utili.
![[array1.c]]
```C
#include <stdio.h>
#include <stdbool.h>

// al posto di scrivere un numero nella definizione uso una macro
#define MAXDIM 50
```

#### Funzione di ricerca (variante con for)
```C
// funzione di ricerca
    // metto const prima dei parametri in solo ingresso per chiedere al compilatore di verificare che non cerco di modificare i valori solo in ingresso
void ricerca (const int v[],const int riempimento, bool *trovato, int *indice, const int valore_da_cercare){ 
    for (int i=0; i<riempimento&&!(*trovato); i++) {
        if (v[i] == valore_da_cercare) {
            *trovato = true;
            *indice = i;
            return;
        }  
    }
    // fuori dal ciclo for sono sicuro che non ho trovato il valore nel mio array 
    *trovato = false;
    *indice = -1;
    return;
}
```
#### Funzione di ricerca del numero di occorrenze di un valore
```C
// funzione di ricerca del numero delle occorrenze di un valore
void ricerca_num_occorenze (const int v[],const int riempimento, int *numero_occorrenze, const int valore_da_cercare){
    *numero_occorrenze = 0;
    for (int i=0; i<riempimento; i++) {
        if (v[i] == valore_da_cercare) {
            (*numero_occorrenze)++;
        }
    }
    return;
}
```
#### Funzione di inserimento di un valore
```C
// funzione di inserimento
bool inserisci(int v[], int *riempimento, int valore_da_inserire){ // dato che ho bisogno di modificare la variabile di riempimento, necessito di un puntatore
    // controllo se ho spazio
    if (*riempimento < MAXDIM){
        v[*riempimento] = valore_da_inserire;
        (*riempimento)++;
        return true;
    } else return false;
}
```
#### Funzione di stampa di tutti gli elementi di un array
```C
// funzione stampa elementi del vettore
void stampa_elementi_vettore(int v[], int riempimento){
    for (int i=0; i < riempimento; i++) {
        printf("%d ",v[i]);
    }
    printf("\n");
    return;
}
```

#### Chiamata delle funzioni
```C
int main (){
    // inizializzo e dichiaro il vettore
    int voti_esame[MAXDIM] = {27,30,31,25,18};
    // inizializzo la variabile di riempimento
    int num_esami = 5; //la inizializzo al prossimo indice utile
    
    bool trovato_voto;
    int indice_voto;
    int voto_da_cercare = 18;
    int n_voti_trovati;

    ricerca(voti_esame, num_esami, &trovato_voto, &indice_voto, voto_da_cercare);

    if (trovato_voto) {
        printf("ho trovato il voto %d (la prima volta) ", voto_da_cercare);
        printf("all'indice %d\n", indice_voto);
    } else {
        printf("non ho trovato il voto %d\n", voto_da_cercare);
    }
    
    ricerca_num_occorenze(voti_esame, num_esami, &n_voti_trovati, voto_da_cercare);

    printf("ho trovato il voto %d %d volte\n", voto_da_cercare, n_voti_trovati);

    // mi conviene invocare la funzione di inserimento in questo modo, così posso fare tutto il debug possibile e immaginabile 
    if (inserisci(voti_esame, &num_esami, 18)) {
        printf("Inserimento avvenuto con successo\n");
    } else {
        printf("Inserimento fallito\n");
    }
    
    stampa_elementi_vettore(voti_esame, num_esami);

    return 0;
}
```

### Stringhe
![[Stringhe]]

### Record
Un *record* è un tipo di dato strutturato **non omogeneo**.

Gli elementi di una struttura sono detti *campi* o *membri* e si accedono usando il nome del campo.

In [[C]] lo definiamo con la parola chiave `struct`.
```C
struct <nome generico struttura> {
	tipo *nome campo*;
	tipo *nome campo*;
}
```

>[!esempio] Esempio:
>```C
>struct tipo_data {
>	int giorno;
>	char mese[15];
>	int anno;
>}
>```

Se devo dichiarare una variabile di tipo `struct tipo_data` lo faccio in questo modo:
```C
// dopo averla dichiarata:

struct tipo_data oggi;
```
Per accedere alle variabili uso quella che si chiama **dot notation**; quindi, nel caso del codice sopra:
```C
oggi.giorno = 20;
oggi.anno = 2025;
strctpy(oggi.mese, "novembre");
```

>[!info] N.B.
>Quando dichiaro la struttura di un *record*, il compilatore non alloca nessuna memoria. Solo quando dichiaro un record stesso alloco spazio.

#### Osservazioni:
Un record occupa *almeno* uno spazio uguale alla somma delle dimensioni dei campi che lo compongono, ma per questioni di efficienza dell'accesso alla memoria, il compilatore potrebbe allocare i campi del record in locazioni di memoria **non contigue**.
L'unico modo che abbiamo per *conoscere la dimensione* di un record è usare `sizeof` (vedi esempio su slide).

Su due record **non è definito il confronto o l'operatore di uguaglianza**, ma posso farlo sui campi singoli.

Possiamo fare un operazione di assegnazione del tipo:
```C
struct_a = struct_b;
```
In questo caso viene copiato il *contenuto* delle variabili **campo per campo**.
Nel caso dei puntatori, punteranno alla *stessa area di memoria*.
Nel caso degli array, vengono copiati *completamente*.

#### Puntatori a record
Nel caso di una struct, un puntatore può essere definito in questo modo:
```C
struct nome_struttura* ptr;
```
Per accedere al campo dovremmo scrivere:
```C
(*ptr).riga; // mi servono le parentesi per la precedenza
```
Abbrevio questa sintassi con la notazione a frecce:
```C
ptr->riga;
```

Per l'aritmetrica dei puntatori, le operazioni su di loro li spostano di multipli della dimensione della variabile a cui puntano, quindi ***non ho bisogno*** di tenere conto della *dimensione* del record.

### Array Multidimensionali
In [[C]] è possibile anche dichiarare array **multidimensionali**.
La sintassi è:
```C
tipo nome_array[dim1][dim2] ... [dim n];
```
La rappresentazione in questo caso funziona come una matrice.
In questo caso la prima dimensione setta il numero di *colonne* la seconda il numero di *righe*, e così via.

>[!esempio] Esempio
>```C
>int num[2][3] = {{1,2,3},{4,5,6}};
>// oppure 
>int num[2][3] = {1,2,3,4,5,6};
> 
> // accedo ad un elemento con entrambi gli indici:
> int num2 = num[1][2];
>```

### Typedef
Un *typedef* è uno strumento che dovviamo conoscere ma non è obbligatorio usare. Il professore consiglia di evitare di *abusarne*, o utilizzarlo at all. Magari proviamolo qualche volta per capire come funziona ma evitiamo di utilizzarlo grazie.

Typedef ci permette di definire una nuova parola per chiamare un tipo *già esistente*.
La sua sintassi è:
```C
typedef tipo_esistente nuovo_tipo
```

Quando può servire?
Se ho ad esempio un record chiamato `struct persona`, con *typedef* posso dire al compilatore che quando scrivo `individuo`, trattarlo come `struct persona`, che da quel momento in poi funziona come **alias** di `struct persona`. Questo rende il codice più leggibile ma onestamente neanche troppo utilissimo. 
In ogni caso dopo aver usato *typedef* posso comunque **continuare ad utilizzare** il nome originale del tipo esistente.

Possiamo anche **definire un tipo** all'interno di un typedef *implicitamente*.
```C
typedef struct tipo_data{
	int giorno;
	char mese[15];
	int anno;
} Data;
Data data_esame = {10, "Giugno", 2022};
```
In questo modo stiamo facendo in un solo colpo la definizione del record `tipo_data` e l'assegnazione al typedef `Data`. 

Molto cute come posso creare un record **anonimo** in questo modo:
```C
struct {
    int giorno;
    char mese[15];
    int anno;
} data;

data = {3, "dicembre", 2024};
```
Nota come in questo caso possiamo usare `data` **SOLO UNA VOLTA**.

Posso utilizzare *typedef* per rendere uno struct anonimo riutilizzabile, senza doverci portare appresso il token `struct`.
```C
typedef struct{
	int giorno;
	char mese[15];
	int anno;
} Data;

Data data_fine;
```
