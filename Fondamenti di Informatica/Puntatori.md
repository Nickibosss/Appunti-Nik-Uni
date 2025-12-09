#programmazione #teoria #università #roba_complicata
Odio i puntatori odio i puntatori odio i puntatori

Un puntatore è una *variabile*, quindi uno spazio di memoria riservato dal elaboratore, che contiene un **indirizzo**.
In [[C]], l'esistenza dei puntatori ci permette di modificare la *memoria* direttamente.

Servono a:
- Gestire la memoria in maniera *dinamica*.
- Gestire le *sequenze di valori* (**array**, **vettori**).
- Gestire i *parametri di una funzione*.
- Accedere a pezzi specifici di memoria.

Come sono fatti in [[C]].
Un puntatore contiene un indirizzo, ma per definizione una variabile di tipo *puntatore* non è una variabile ad **intirizzo generico**, ma ad indirizzo **strettamente tipizzato**, Quindi dobbiamo sapere *specificamente* a che tipo di variabili punta.
Sono grandi quanto è grande l'indirizzo di memoria, quindi dipende strettamente dalla *architettura* della macchina.

Si dichiarano usando `*` in questo modo:
```C
nome_tipo_variabile* nome_puntatore;
```
Il tipo di variabile seguito dall'asterisco determina il tipo di variabile a cui punta il puntatore.
Se voglio dichiarare più puntatori posso usare sintassi del tipo:
```C
int *p1, *p2, *p3;
```
Ad un puntatore posso *assegnare* solo indirizzi di variabili di tipo **uguale** alla sua dichiarazione.

Se voglio convertire un puntatore in un altro devo usare la sintassi di **cast**:
```C
pintero = (int*) preale;
```

La gestione delle varibili di tipo puntatore fa utilizzo degli operatori `&` e `*`.
- `&` `- operatore di referenziazione-` restituisce l'*indirizzo della locazione di memoria* nel quale la variabile è memorizzata.
- `*` `-operatore di puntamento-` dato un puntatore, porta al *valore della variabile puntata*; quindi parto dal puntatore ed arrivo all' *area cui punta il puntatore*.

Facciamo un esempio:
```C
int *punt; // definisco un puntatore ad intero
int x;     // definisco una variabile di tipo int

punt = &x; // con l'operatore di referenziazione trovo l'indirizzo di x e
           // lo assegno al puntatore punt (posso fare perchè tipo di 
           // puntatore e variabile sono *uguali*)

*punt = 15;// con l'operatore di puntamento, accedo all'area di memoria 
		   // a cui porta il puntatore, e ci assegno il valore 15.
```

>[!tip] Stampa di un puntatore
>Per stampare un puntatore utilizzo `%p`!

