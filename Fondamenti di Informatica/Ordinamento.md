#università #programmazione #teoria 
Cosa abbastanza ovvia ma per ordinare una struttura dati devo avere un *criterio* per ordinarli.
Un algoritmo di ordinamento è un algoritmo che restituisce una struttura di dati, o la *modifica*, ordinando gli elementi.
Seguono delle soluzioni molto basilari, ma ez per il boss.
### Selection sort
Il **selection sort** è un algoritmo dei più basilari.
Ipotizziamo di avere un vettore non ordinato.
```
2 5 7 6 1 4 3
```
Il selection sort prende l'elemento più piccolo del vettore *da ordinare*, lo scambia con l'elemento in prima posizione, e nella prossima iterazione inizia dal *secondo elemento*.
```
// [] vettore considerato
// ^ minimo trovato
[2 5 7 6 1 4 3]
         ^
1 [5 7 6 2 4 3]
         ^
1 2 [7 6 5 4 3]
             ^
1 2 3 [6 5 4 7]
           ^
1 2 3 4 [5 6 7]
         ^
1 2 3 4 5 [6 7]
           ^
1 2 3 4 5 6 [7] // ultimo passaggio
				// non necessario dato che ultimo elemento è 
				// necessariamente ordinato
             ^
```
Dopo `n-1` passi il vettore risulterà *ordinato*.

Parlando di complessità asintotica la complessità è **quadratica** (`n*n`).

>[!example] Esempio:
>```C
>void selection_sort (int v[], int dimensione){
>	for (int i=0; i<dimensione; i++){
>		int pos_min = minimo(V, dimensione-1, i);
>		scambia (V+i, V+pos_min);
>	}
>}
>```
>In questo caso `minimo` e `scambia` sono funzioni già implementate. 

> [!example] Possibile implementazione di `minimo` e `scambia`
>```C
>// minimo:
>int minimo(struct cliente v[], const int dimensione, const int i){
>    int pos_minimo = i;
  >  for (int j = i+1; j<dimensione; j++) { // j = i+1 così non controllo v[i]>v[i]
>        if (v[pos_minimo].tipo>v[j].tipo) {
>            pos_minimo=j;
>        }
>    }
>    return pos_minimo;
>}
>
> // scambia:
> void scambia_clienti(struct cliente v[], const int pos1, const int pos2){
>    struct cliente temp = v[pos1]; // buffer
>    v[pos1]=v[pos2];
>    v[pos2]=temp;
>    return;
>}
>```

### Insertion sort
L'insertion sort invece descrive un approccio differente che è analogo all'ordinamento di un mazzo di carte.
Lavora su *due  vettori*. 
Parte dal vettore di elementi da ordinare e itera in questo modo:
- Scorre il vettore da ordinare, seleziona un valore
- Decide dove inserirlo nel secondo vettore ( o opportunamente *sottovettore*)

```
// ^ valore considerato
- 3 5 6 1 4
  ^
-

- 3 5 6 1 4
    ^
- 3
  
- 3 5 6 1 4
      ^
- 3 5
  
- 3 5 6 1 4
        ^
- 3 5 6
  
- 3 5 6 1 4
          ^
- 1 3 5 6
  
- 3 5 6 1 4
- 1 3 4 5 6
```
Sicuramente è più efficiente lavorare in un solo vettore, spostando i valori *non considerati* (che inserisco all'inizio dell'array come nel *selection sort*).

**IMPORTANTISSIMO**
Ovviamente in questo caso abbiamo bisogno di un indice che indica l'elemento che consideriamo e per ordinare l'elemento facciamo confronti due a due **da sinistra a destra**.


[vedi implementazione sul PDF]
> [!example] Ecco una possibile implementazione:
>```C
>void insertion_sort (int v[], int dimensione){
>    for(int i=1; i<dimensione; i++){
>        int j=i;
>        while(V[i]<V[j-1] && j>0){ // confronto elementi due a due da sinistra a destra
>            scambia(V+j,V+j-1);
>            // comodo stampare vettore ad ogni passaggio per debug
>            j--;
>        }
>    }
>}
>```

### Merge sort
Il merge sort è un algoritmo proposto da *Von Neumann* e usa la [[Ricorsione|ricorsione]].
Usa la tecnica **divide et impera**.

L'algoritmo è semplice:
- se la sequenza ha lunghezza 1, è implicitamente ordinata
- Altrimenti divido la sequenza in **due metà** (*divide*):
	- Ognuna di queste sottosequenze vengono ordinate **applicando ricorsivamente la funzione** (*impera*).
	- Le due sequenze ordinate vengono poi unite (*merged*).
```
6 3 2 1 4 5

6 3 2 | 1 4 5
6 | 3 2 || 1 | 4 5
6 || 3 | 2 ||| 1 || 4 | 5

Qui ho sottosequenze ordinate, per fare merge posso ordinarle molto più facilmente, devo confrontare solo il *primo termine* della sequenza, poi incrementare la posizione se il confronto è positivo.

Parto dal basso:
3 | 2 -> 2<3 -> 2 3 // merge
4 | 5 -> 4<5 -> 4 5 // merge

6 | 2 3 -> 2<6 -> 2 X X -> 3<6 -> 2 3 6 // merge
1 | 4 5 -> 1<4 -> 1 4 5// merge

2 3 6 | 1 4 5 -> 1<2 -> 1 X X X X X -> 2<4 -> 1 2 X X X X -> 3<4 -> 1 2 3
-> 4<6 -> 1 2 3 4 X X -> 5<6 -> 1 2 3 4 5 6
```

> [!example] Ecco una possibile implementazione:
> ```C
>void merge_sort(int v[], int left, int right){
>	int mid;
>	if (left<right){ // se è un solo elemento left=right
>		mid = (left + right) / 2;
>		
>		merge_sort (v, left, mid);
>		merge_sort (v, mid+1, right);
>		
>		// fonde due sequenze ordinate [left, mid] , [mid+1, right]
>		merge(v, left, mid, right);
>	}
>}
>```
