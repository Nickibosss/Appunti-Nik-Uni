#codifica_e_rappresentazione #università #teoria 
Sia per quanto riguarda **immagini o video**, sia per **suoni**, dobbiamo codificare un segnale *analogico* in maniera *discreta*.
Effettivamente questo da necessità di un *operazione di discretizzazione*. Quindi trasformare i valori **continui** tramite *Campionamento* e *Quantizzazione*.
Abbiamo già parlato di questo (Ricordiamo che mentre il campionamento non comporta necessariamente una perdita di precisione mentre la Quantizzazione porta necessariamente ad un errore di approssimazione).
### Codifica del suono
La frequenza di campionamento *dovrebbe essere* legata alla frequenza dell'onda.

Secondo la *legge di Nyquist* se la *frequenza del campionamento* è il **doppio** della *frequenza di variazione*, sono in grado di ricostruire perfettamente il segnale originale.

L'uomo però può percepire suoni solo fino a *20 kHz*. Quindi un campionamento di *40 kHz* è sufficiente.
- Noi come standard usiamo un campionamento di *44.1 kHz*.

Esempio:
- Di quanti bit abbiamo bisogno per memorizzare un brano musicale di 3 minuti, campionato a 30 kHz, con quantizzazione a 16 bit?
```
3 minuti = 180 secondi
30 kHz   = 30000 campioni al secondi
16 bit per campione = 16*300000 = 480000 bit per secondo
86400000 bit per memorizzare tutto il brano.
```
Se riduciamo la *frequenza di campionamento*, significa che al posto di essere in grado di catturare tutte le frequenze, *perdiamo quelle più alte*.
Ricordiamo che stiamo ragionando in sistemi *non compressi*.

Parlando in maniera più generale del suono, per la codifica la cosa principale che determina *come la faccio* è l'**uso** che dobbiamo fare del segnale audio.
Il caso precedente è quello dell' *ascolto umano* di un suono.

### Codifica delle immagini
Anche nel caso delle immagini, sono una *rappresentazione continua*.
Come faccio, quindi, a **rappresentare un immagine**?

Quella che analizziamo adesso è la **rappresentazione bitmap**.

#### Codifica Bitmap
La rappresentazione inizia con il campionamento:
- Un tipico approccio suddivide l'immagine in una *griglia*, in singoli elementi che chiamo *pixel*.
I quadratini che hanno un colore dominante li codifichiamo con `1`, mentre nel caso opposto con `0`.
- In questo caso diamo *un bit* per pixel. Questo funziona solo se abbiamo una immagine *monocromatica*.

In funzione del *numero di bit* che affidiamo a un pixel, otteniamo una *gamma di sfumature*.
Per le immagini a colore dividiamo ogni colore in *tre canali* (a seconda della codifica). A variare dell'intensità dei **colori primari** possiamo avere tutte le *possibili sfumature*.
- In genere in digitale usiamo **r** , **g** e **b** come colori primari perché abbiamo una rappresentazione *additiva*, ma esistono tantissime possibilità di colori primari (la scienza che studia i colori come combinazioni di più primari si chiama **colorimetria**.
Dal punto di vista della *rappresentazione*, quindi, al posto di rappresentare una scala *di grigi*, affido una quantità di bit *per ogni canale*, **per pixel**.

In genere usiamo *8 bit* per canale, per pixel; cosa che ci porta a un totale di ***24 bit***, cioè *16 milioni di colori*.
Ovviamente se ho un campionamento più *granulare*, quindi utilizzo una **risoluzione** maggiore, la rappresentazione diventa più **simile alla grandezza vera**.
- Ovviamente questo però porta ad un aumento della memoria necessaria per la rappresentazione.

Questo è vero anche per la scelta del *numero di colori*. Una rappresentazione con più colori porta necessariamente una rappresentazione migliore. 
- Quando ho *meno colori* perdo la capacità di distinguere tonalità *più vicine*.
- Analogamente al campionamento, anche una **profondità di colore** maggiore porta ad una immagazzinamento *più pesante*.

Quindi in riassunto: più *pixel* ho (quindi maggiore la **risoluzione**), più *bit* utilizzo **per pixel** (quindi maggiore la **profondità di colore**), *maggiore* è la qualità, ma *maggiore* è anche lo *spazio in memoria* che utilizzo.

#### Codifica Vettoriale
Una immagine vettoriale parte inizialmente in modo *digitale*.
Se per esempio dovessi rappresentare un *triangolo*, basta che immagazino le coordinate dei suoi **vertici**.
Questo fa in modo che non ho limiti di *risoluzione*, perché il programma che mi permette di *visualizzare il file*, **ricalcola a momento** la rappresentazione.

### Codifica dei video
Per riprodurre un video si vanno a sfruttare delle proprietà *psicovisive* umane. Se mostro alla retina una sequenza *continua* di immagini veloce, do **illusione** di movimento.
Effettivamente questo fa in modo di trovare problemi nella rappresentazione *bitmap*, dato che effettivamente per una serie di *frame* il numero di byte che utilizzo per codificare un video cresce in maniera **molto veloce**.

Esempio
```
Filmato 4k (3840 x 2160)
48 bit per pixel
24 fps
Durata 2 ore

4k = 8 mil pizxel
1 pixel = 48 bit
2 ore = 7200 pixel

Spazio totale = ~7.8 TB
```

Quindi necessito di applicare una **compressione**.
La compressione è un *processo* che permette di ottenere una codifica meno **pesante**.
Esistono due approcci
- Compressione *lossless* (senza perdite).
	- Questo significa che se applico il *processo inverso* posso ottenere la rappresentazione di partenza.
- Compressione *lossy* (con perdite).
	- Anche se perdo precisione, la compressione lossy conviene dato che effettivamente la *perdita* di **variazioni minute** non diminuiscono *percepibilmente* la qualità.

#### Compressione lossless
Esistono diversi tipi di *compressione lossless*.
- Un metodo è Codificare le sequenze di valori ripetuti come un *indicatore di ripetizione*.
- Se ho solo un *numero limitato di colori* nella mia immagine, posso rappresentare solo questi usando una *tabella di valori*.
	- Se però utilizzo tutti i colori la compressione darà un valore più pesante.
- Posso anche codificare solo la *variazione* tra i dati.
	- Quindi codifico solo la **differenza** tra il *valore attuale* e quello *precedente*.

#### Compressione lossy
Esempi di codifiche *lossy* sono:
- **MPEG**
- **JPEG**
- **MP3**
Il principio è sempre quello di *eliminare* informazioni **irrilevanti**, cioè informazioni che non codificano valori che quando perdiamo non ce ne accorgiamo -- ``riscrivi grazie
Per queste rappresentazioni utilizziamo principi **psico-acustici** per decidere quali informazioni *posso eliminare*.
