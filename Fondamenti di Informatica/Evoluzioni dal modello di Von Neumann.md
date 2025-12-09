#università #architettura #roba_complicata #teoria
Nella realtà ci sono una serie di ottimizzazioni che vengono fatte dal modello:

### Prima ottimizzazione - Interrupt
Nel [[Algoritmi e modelli di esecutore (macchina di Touring)|modello di Von Neumann]], il processore è sempre attivo nella sequenza del ciclo.

In realtà esistono alcune operazioni che possono essere delegate a componenti esterni.
Per gestire questo approccio dobbiamo definire alla periferica *delegata* dalla cpu un meccanismo di segnalazione che permette alla periferica di dire alla CPU quando ha finito un compito.
Questo si chiama **interrupt**.

Le varie periferiche fanno il loro lavoro nel frattempo che il programma si evolve. Quando hanno finito sollevano il *bit di interrupt* a loro associato.

Alla fine della fase di esecuzione la CPU controlla se ci sono **segnali di interruzione**, se questo accade, la CPU esegue la ISR (Interrupt Service Routine), che gestisce l'interrupt; altrimenti continua alla prossima fase di fetch.

Può accadere che più periferiche segnalino un interrupt *contemporaneamente*, In questo caso c'è bisogno di una *maschera di priorità*, che fa passare solamente la richiesta di interrupt con **priorità maggiore**.

### Seconda evoluzione - Cache
Nella realtà è possibile utilizzare alcuni meccanismi di immagazinazione **intermedi** tra CPU e Memorie. Questo ci permette di accedere *più velocemente* ad alcuni dati immagazinati.

Le memorie di Cache possono essere di diverso tipo:
- L1, quando sono *interni* alla CPU.
- L2, quando sono *intermedie* tra CPU e Memoria Centrale (RAM).
Ovviamente la memoria L1 è diverse volte più veloce della L2, mentre la L2 è comunque molto più veloce della Memoria Centrale.

Quindi non parliamo più di una sola memoria centrale, ma di diversi **livelli di memorie**.

> [!tip] 
> Le memorie Cache e RAM sono volatili, mentre la Memoria Di Massa è **persistente**

Come faccio a capire cosa mettere nella *cache*?
Si parla di **località temporale** e **località spaziale**.

Esempio:
- **località temporale**.
Se sono in un ciclo iterativo, è probabile che devo avere bisogno che le istruzioni che lo accompagnano siano necessarie in breve. In questo caso le inserisco in Cache.

- **località spaziale**.
Se accedo ad un registro, è plausibile che abbia bisogno di utilizzare istruzioni vicine, in questo caso le immagazino nelle cache.
