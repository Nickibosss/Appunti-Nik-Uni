#università #architettura #teoria 
Nell'informatica noi studiamo i *processi* che servono a elaborare le informazione e trovare una soluzione a un probelema.
iniziamo sempre *analizzando* il problema, poi *progettiamo una soluzione*.
Ma il nostro lavoro non finisce quì perché dobbiamo pensare poi alla **correttezza** e **efficienza** della soluzione. Quindi dalla nostra analisi troviamo una soluzione *efficace* e poi la possiamo *ottimizzare*, cioè troviamo una soluzione che impiega meno tempo e risorse possibili.

Ci sono due elementi quindi nel nostro lavoro:
- Algoritmo
	- cioè effettivamente la sequenza di operazioni necessarie a risolvere il problema.
- Esecutore
	- La struttura che è in grado di seguire l'algoritmo.
	- Deve essere in grado di comprendere l'algoritmo.

Quindi quale è il problema?
Che caratteristiche devono avere i computer per ricevere un algoritmo.

Qui dobbiamo parlare di **modello**.
Un modello è una *astrazione* di un fenomeno che ci permette di **descrivere** la realtà.
Vedremo due esempi di *modelli di esecutore* e perché sono importanti.

## Macchina di Turing
Una **macchina di Turing** è un modello fondamentale che ci permette di raggiungere risultati teorici su *calcolabilità* e *complessità* degli algoritmi. 
*Turing* ha proposto un modello di elaborazione che può essere definito dal concetto di **automa**, cioè un sistema che *esegue* delle *computazioni*.

### Automa
L'automa realizza il *legame* tra $x$, cioè i dati in ingresso e $y$ cioè i risultati dell'elaborazione.

Si definisce automa **a stati finiti** dato che conserva informazione rispetto allo *stato* in cui l'automa si trova, e dallo stato stesso dipende anche il *risultato* dell'elaborazione.
Sostanzialmente possiamo immaginare l'elaborazione come una *transizione* tra gli stati degli ingressi che porta ad una uscita.

Quindi possiamo andare a formalizzare un automa come una quintupla: $(Q,I,U,t,w)$.
- $Q$ è un insieme finito di stati interni.
- $I$ è un insieme finito di ingressi.
- $U$ è un insieme finito di uscite.
- $t$ è la *funzione di transizione* che, rispetto agli ingressi, mi determina il prossimo stato.
- $w$ è la funzione che ci permette, rispetto allo stato corrente e quelli degli ingressi, di determinare la soluzione.

Per rappresentare un automa possiamo usare i **grafi**.
###
La macchina di turing ci permette di descrivere una *macchina* che permette di descrivere come si risolve un **problema generico**, cioè una macchina che evolva per risolvere algoritmi.

>[!example]  Riconoscitore di sequenza `11`
>`0100101101001`
>La mia macchina deve leggere una cifra alla volta e deve tenere traccia della iterazione precedente.
>Ho quindi bisogno di tre stati nel mio automa a stati finiti:
>`stato 0`: ho visto `0` all'iterazione precedente
>`stato 1`: ho visto `1` all'iterazione precedente
>`stato 2`:  ho trovato la sequenza `11`
>
>La mia funzione di transizione quindi farà questa operazione:
>Se sono nello `stato 0` e leggo `1` passo nello `stato 1`
>Se sono nello `stato 1` e leggo `0` passo nello `stato 0`
>Se sono nello `stato 1` e leggo `1` passo nello `stato 2`

Una macchina di Turing ha bisogno di un *nastro bidirezionale* idealmente infinito e di una testina che *legge* il nastro. La macchina ad ogni iterazione legge il simbolo sotto la testina, e a seconda del simbolo, stato in cui si trova e funzione ricava:
- **Risultato.
- **Stato in cui spostare la macchina.
- **Se e in che verso devo spostare la testina.**

Possiamo formalizzare quindi la macchina di turning come una *specializzazione* della quintupla dell'autome [vedi pdf]

La macchina quindi è capace di:
- Leggere il nastro.
- Scrivere il nastro il simbolo specificato dalla funzione di macchina.
- Transitare in un nuovo stato interno specificato dalla funzione di stato.
- Spostarsi sul nastro di una posizione nella direzione indicata dalla funzione di direzione.
La macchina si ferma quando raggiunge lo stato di terminazione.

Questa macchina però è una macchina *specifica*, come facciamo quindi a passare da una macchina specifica a quella *generica*?
Semplicemente facendo in modo che la macchina, dallo stesso nastro, possa **leggere anche le istruzioni**.

Questa macchina si chiama **macchina universale** e si dice, se legge le istruzioni, *Interprete di linguaggio*.
Qui è importante introdurre la *tesi di Church e Turing*, cioè che **non esiste formalismo più potente della macchina di Turing per modellare una computazione meccanica**.

In questo modo possiamo definire i problemi come:
- *Dedicibili*, quando possono essere risolti meccanicamente da una macchina di Turing.
- *Indedicibili*, tutti gli altri.
I computer di oggi, anche se si sono *evoluti* in velocità, sono basati sugli **stessi principi** alla base della macchina di Turing.

Un problema però anche se risolvibile, potrebbe essere **non trattabile**.
Quando parliamo di **trattabilità** diciamo che un calcolatore arrivare a una soluzione in base alle possibilità di esecuzione dell'esecutore.
In questo caso parliamo di due elementi:
- Spazio
	- Sostanzialmente la memoria a disposizione.
- Tempo
	- Il tempo effettivo necessario a produrre la soluzione.
In genere non siamo interessati alle **misure esatte** di questi due elementi, ma semplicemente quanto questa complessità *cresce* in confronto alla *crescita degli ingressi*.

In genere noi la definiamo in base a una funzione di $n$ dove $n$ è la grandezza dei nostri ingressi.
Nella pratica siamo interessati al caso peggiore di questa complessità.

In genere ci interessa la *complessità asintotica*, cioè se **superata una certa soglia** quale complessità è migliore. Quindi come evolve la complessità per *ingressi grandi*.
Esistono diversi **classi di complessità** e le più diffuse sono:
- Logaritmica
	- Cioè cresce in funzione di $\log n$.
- Polinomiale
	- Cioè cresce in funzione di $n$, $n^{2}$,$n^{3}$.
- Esponenziale
	- Cioè cresce in funzione di $a^{n}$. 

### Modello di Von Neumann
Il modello di Von Neumann descrive un elaboratore elettronico in una serie di blocchi, ed è pensata per essere, al contrario della macchina di touring, **fisicamente realizzabile**
A prima battuta identifichiamo 4 blocchi.
- CPU
	- Scambia informazioni con le *memorie*.
- Memorie
	- Vanno a sostituire il nastro infinito della macchina di touring.
	- Conserva delle *informazioni*.
		- Le informazioni si dividono in *istruzioni* e *dati*.
- Periferica di input
	- Inserisce informazioni dall'*esterno* nella memoria
- Periferica di output
	- Porta informazioni

Adesso andiamo a scomporre i pezzi singoli
#### Memorie 
In generale una memoria serve a conservare informazioni.
Queste memorie possono essere:
- Volatili
	- Cioè si svuotano se si stacca l'alimentazione
- Permanenti
	- Cioè rimangono permanentemente

Dal punto di vista pratico, c'è una grande differenza tra i diversi tipi di memoria:
- **Memorie elettroniche**
- **Memorie magnetiche**
- **Memorie ottiche**
- **...**
Ma dal punto teorico fanno tutte la stessa cosa: immagazinano informazioni.

Rispetto ad una memoria posso fare 2 tipi di operazioni:
- **Load** - cioè lettura
- **Store** - cioè scrittura 
	- (il processo di scrittura overwrites i valori presenti nel blocco)
Non ci interessa come sono fatte ma ricordarci queste due operazioni.

Una memoria la possiamo schematizzare come una serie di **registri** che sono sequenze di bit, che per praticità vengono **accesse** in gruppi di *byte*, in questo caso si dicono *byte addressable*.
In questi registri vengono immagazinate tutte le informazioni di cui ho bisogno.

La memoria si interfaccia con gli altri blocchi attraverso 3 *canali*.
- Buffer **indirizzo**.
	- Nel buffer indirizzo transitano le informazioni che mi permettono di andare ad accedere al registro che mi interessa.
- Buffer **dato**.
	- Nel buffer dato transitano i dati.
- **Canali di controllo**.
	- Per fare qualsiasi operazione dobbiamo attivare uno dei due canali di controllo *read* o *write*.

>[!esempio] Esempio:
>Per scrivere un dato in un blocco, inserisco un valore nel buffer dato, specifico l'indirizzo nel buffer indirizzo e attivo il canale di controllo write. In questo modo transitano i dati dal buffer dato al blocco di memoria

Nel modello di Von Neumann all'interno della memoria sono immagazinati sia *dati* che [[Istruzioni]], in questo caso la definiamo una macchina *"stored procedure"*, e la rende *general purpose*.

Non esiste una cella di memoria "vuota", ma contiene sempre sequenze di `0` e `1`, che nel caso non vengano scritte contengono dati "casuali".

### CPU
[vedi cpu da pdf]

>[!tip] **Quando parliamo di CPU:**
>*MAR* - buffer indirizzo
>*MDR* - buffer dato

Ciclo del processore
Il ciclo del processore è formato da tre fasi:
- Fetch
	- Viene prelevata una istruzione dalla memoria
- Decode
	- Questa istruzione viene decodificata
		- Si trovano le cose che deve fare la cpu
		- In alcuni casi devono essere preparati e assemblati gli operandi
- Execute

#### Descrizione di un ciclo del processore

Fase di fetch:
- Prelevo la istruzione dall'indirizzo PI e lo inserisco nel *Memory Data Register* e lo inserisco nel IR, **aggiorno l'indirizzo PI** secondo le fasi precedenti.
Fase di Decode
- La CU [[Codifica dei numeri|decodifica]] l'istruzione e nel caso esegue la *operand assembly*. In questo modo preparo tutti i componenti del caso.
	-  Durante la *operand assembly* l'indirizzo degli operandi viene direttamente dalla **CU**, quindi **non passa per il registro PI**.
Fase di Execute
- Le istruzioni che ho preparato vengono eseguite dalla ALU, **aggiorno il CC** e inserisco il risultato nel ACC.
A questo punto ricomincio dalla fase di Fetch.

Tutte queste operazioni viene sincronizzata da un segnale di *clock*, che periodicamente passa da uno stato "alto" a uno "basso". Più la frequenza è alta, più velocemente lavora la CPU. Il clock non ci dice precisamente quante istruzioni vengono eseguite al secondo, ma questo dipende anche dalla velocità dell'architettura.