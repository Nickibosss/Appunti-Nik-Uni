#università #programmazione #logica #teoria 
Un sottoprogramma è definito ricorsiva se nel corpo della funzione viene *chiamata* la **funzione stessa**.
L'esempio classico è il calcolo del fattoriale:
```C
int fatt(int n){
	// il fattoriale di un numero è se stesso per il fattoriale del 
	// precedente
	int f;
	if(n<=1) f = 1; // 0! = 1, 1! = 1
	else f = n*fatt(n-1);
	return f;
}
```
In sostanza queste funzioni portano a una fase *ascendente*, cioè una invocazione progressiva delle funzioni, e una fase *discendente*, in cui i risultati vengono restituiti progressivamente.
Questa cosa funziona perchè abbiamo definito due casi: uno che **restituisce direttamente** il risultato e un altro che **invoca la funzione**, altrimenti sarebbe invocata *all'infinito*.

Parlando di memoria:
- Nella fase ascendente salvo sullo *stack* (per questo ascendo) le variabili formali, quelle interne alla funzione e l'**indirizzo di ritorno**.
	- Questa si chiama *record* di attivazione.
	- Quindi alloco il *record di attivazione* della prima invocazione, che alloca la seconda invocazione e così via.
- Nella fase *discendente*, quando l'ultima funzione finisce, dealloca il suo *record di attivazione* dallo stack.
	- Quindi dealloca il *record di attivazione* dell'ultima invocazione, poi della penultima e così via.

Ogni qualvolta che è possibile scrivere una funzione ricorsiva, è sempre possibile scriverne una versione **iterativa**.
Nella pratica dobbiamo stare attenti alla **non convergenza**, che farebbe in modo che le chiamate ricursive procederebbero *all infinito*, o almeno fino all'esaurimento dello spazio (**segmentation fault**).
