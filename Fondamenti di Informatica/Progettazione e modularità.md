#università #programmazione #teoria 
Per andare a progettare un *algoritmo* devo innanzitutto andare a **scomporre** il problema che voglio affrontare, in maniera anche opportunatamente iterativa.
Il risultato di questa scomposizione è la divisione del mio programma in piccoli pezzettini chiamati **moduli**.
Il vantaggio di una soluzione *modulare* è che ogni pezzo è più facile da *testare*, *interpretare* e 

La mia progettazione quindi necessita di una *analisi* **top -down**, quindi divido il problema in 
### I moduli
Innanzitutto per andare a definire un modulo è necessario fare *astrazione*. -> quindi non mi interessa come il modulo processa, ma semplicemente *cosa risolve*

Nel mio programma posso trnquillamente *invocare* una soluzione sapendo cosa risolve, ma **non interessandomi** al modo in cui questa soluzione viene trovata.

Ogni modulo è quindi composto da due parti:
- **Interfaccia**
	- Quello che effettivamente esce all'esterno
- **Corpo**
	- 

I tipi di astrazzione di cui mi servo sono:
- Astrazione sul controllo:
	- Quindi astraggo una *funzionalità* dai dettagli della sua implementazione.
	- Scompongo la mia soluzione in *sottoprogrammi*.
- Astrazione sui dati:
	- (vedi pdf non ho capito benissimo)
	- I linguaggi di programmazione *ad oggetti* lavorano sull'astrazione sui dati

### Sottoprogrammi
Un sottoprogramma scambia *informazioni* con il suo **Programma chiamante**, sia in ingresso che in uscita.

Come definisco un sottoprogramma in c?

Definisco l'**interfaccia**: quindi i valori che vengono scambiati da **programma chiamante e sottoprogramma**.

Necessito quindi definire un intestazione di questo tipo:
```c
tipo_ritorno nome_fun (tipo_par  Parametro1, tipo_par Parametro2 ...){
	<Corpo Funzione>
}
```

Qui ho definito:
- il **tipo** di dato che mi aspetto ridare dal programma,
- il **nome** della funzione.
- i **parametri** che entrano nella funzione.

Questa si chiama *signature* della funzione.

Quando chiamo un sottoprogramma in genere mi interesso *esclusivamente* dell'interfaccia rispetto alle caratteristiche *precedentemente concordate*. In genere mi interesso del **corpo della funzione** solo se è mio compito programmarlo,
Nel resto dei casi mi interessa esclusivamente sapere come **utilizzare l'interfaccia** del sottoprogramma.

Una volta definito un sottoprogramma posso **invocarlo** usando il suo *nome* e fornendone i *parametri*. 
Questo mi permette di non andare a implementare *più volte* la **stessa soluzione** nel mio programma principale.

Il **programma chiamante** si occupa di *organizzare i parametri*  e *chiamare* o *invocare* il **sottoprogramma**.
Il **sottoprogamma** si occupa di prendere i *parametri* e lavorarci sopra. 