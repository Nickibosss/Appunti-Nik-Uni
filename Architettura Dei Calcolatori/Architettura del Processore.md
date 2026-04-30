Argomento che all'esame non esce, ma utile lo stesso.

Come progettiamo un sistema **General Purpose**?ù
Quando progettiamo queste macchine andiamo a risolvere una problematica che rimane aperta, dato che fino ad ora gli *automi a stati finiti* hanno comportamento limitato a quello che riusciamo a memorizzare.

Importante è differenziare tra una *lunghezza infinita* e una **indeterminata**.
Esempio è contare infiniti numeri: effettivamente in una macchina avrebbe bisogno di **infiniti stati**. Un essere umano invece è *in grado* di contare numeri infiniti.
Effettivamente questo perchè ogni valore, *in ogni istante* è definito! Quindi tecnicamente potremmo contare da **qualsiasi numero arbitrario**.
La differenza è che nel mondo non esiste un *infinito matematico*, ma i nostri problemi hanno **grandezza indefinita**. Quindi il nostro problema, non ha *dimensioni infinite*, ma ad ogni istante ha **dimensioni definite**.

Questo ci porta a poter affrontare una mole molto più grande di problemi *trattabili*.

Effettivamente possiamo ricondurre *anche queste* risoluzioni ad una modellazione matematica, per poi trasformarlo in un **metodo di progetto**, che ci mette in grado di progettare effettivamente una macchina **general purpose**.

Effettivamente il modello matematico a cui ci riconduciamo è la [[Algoritmi e modelli di esecutore (macchina di Touring)|macchina di Touring]].
Si dimostra fondamentalmente, che qualsiasi algormitmo è **realizzabile** con una macchina di Toruing.

L'idea di fondo è che la *macchina di Touring* formalizza la definizione di algoritmo, e divide i problemi in *calcolabili* e *incalcolabili*.
Effettivamente un problema incalcolabile dice che **l'algoritmo non termina**.

Ecco una definizione strutturata di [[Algoritmi e modelli di esecutore (macchina di Touring)|macchina di Touring]].

Le macchine di Touring viste fino ad ora sono macchine che, anche essendo generali, risolvono **un solo problema**. Touring ha anche teorizzato una macchina di Touring **universale**, che ha con input la descrizione di una macchina di Touring, e *tramite i propri stati*, riesce a simulare qualsiasi macchina di Touring.

Cosa significa? che effettivamente la *macchina a stati*, anche se è singola, può eseguire **qualsiasi algoritmo codificabile**.

## Progettiamo una macchina reale
Ora si parla di [[Algoritmi e modelli di esecutore (macchina di Touring)|modello di Von Neumann]]. In Von Neumann, l'unità di controllo (CPU) è l'equivalente dell'**automa** della macchina di Touring. 
Il problema è interfacciarci con il mondo esterno per recepire gli *algoritmi*.
[cit.] Finchè progettiamo un processore chiuso in se stesso, abbiamo fatto il **processore autistico**, è relativamente più semplice; mentre nel momento in cui ci dobbiamo interfacciare nel mondo esterno, diventa più complicato.

Oltre al modello di Von Neumann, esiste un altra architettura nata contemporaneamente che è l'**architettura Harvard**.
Ci sono delle differenze importanti:
- Al posto di avere le memorie al centro dell'architettura, come in Von Neumann, abbiamo al centro l'*unità di controllo*.
- *Abbiamo due memore separate*, una per **programmi** e una per **dati**.
Questo non ci permette di trattare un programma come un *dato*.

Ma noi comunque ragioniamo su *Von Neumann*.

