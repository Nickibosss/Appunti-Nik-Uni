#teoria #università #codifica_e_rappresentazione 
# Rappresentazione dei numeri reali
A differenza dei numeri interi, i numeri reali sono *infinitamente densi*; quindi anche tra due numeri infinitamente piccoli esistono numeri infiniti.
Non possiamo rappresentare tutti questi numeri in un architettura finita.
Quindi oltre al problema di overflow, abbiamo una *perdita di precisione*.
Risolviamo questo problema con un **approssimazione**.
Magari il mio dato non è rappresentabile ma associo comunque un valore *abbastanza vicino*.

L'errore di approssimazione porta a numerosi problemi successivi.
	- anche se abbiamo un algoritmo buono, se non tiene conto di errori di approssimazione, questo si *propaga*, ridandomi un risultato scorretto.
	- a

Risolvo questo errore con un arrotondamento.
Effettivamente non rimuovo totalmente l'errore ma ne introduco uno accettabile.
Per quando questo errore non è prevedibile, è almeno limitato dal peso della cifra meno significativa:
	In generale, se **-m** è il peso della cifra meno significativa, l'errore massimo che commetto è: 
	$$
\epsilon = \frac{1}{2}*10^{-m}
	$$

Esistono due modi principali per la notazione
## Soluzione 1
**virgola fissa**
Dedica una parte prestabilita delle cifre alla parte intera e una parte prestabilita delle cifre alla parte reale.
	esempio:
	Una rappresentazione generica è **XXX.YY**
	L'intervallo rappresentabile è [-999.99 , 999.99].
	La granularità è quindi *0.01*.
	Questi valori sono SEMPRE FISSI rispetto a dove scelgo di porre la virgola.

## Soluzione 2
**virgola mobile**

Per discutere della rappresentazione della virgola mobile dobbiamo pensare alla [[notazione scientifica]].

Vantaggi rispetto alla virgola fissa:
-  Riesco a massimizzare le **cifre significative**.
- Posso rappresentare numeri *molto grandi* ***o*** *molto piccoli* con uno stesso numero di cifre, sia positivi che negativi.
	- Effettivamente se devo rappresentare numeri molto grandi sono in grado di trascurare la parte non intera.

Mentre per la notazione a virgola fissa gli intervalli tra le rappresentazioni sono fissi, in virgola mobile a seconda dell'**esponente** *(cioè il peso della cifra significativa)*
Inoltre, la rappresentazione in virgola mobile, *fissata la base*, consente di esprimere lo stesso valore con infinite coppie **mantissa - esponente**.

Quindi per semplificarmi la vita devo far *scorrere* la virgola decimale fino ad una posizione **conveniente**.
Abbiamo bisogno di metterci d'accordo su come possiamo scegliere, in generale cerchiamo sempre di *massimizzare la precisione*.

Ci serviamo della forma normalizzata della mantissa.
- La mantissa è normalizzata quando:
	- **La sua prima cifra è diversa da zero.
	- **La sua parte intera sia un numero minore della base.**
- In base due:
	- **La sua prima cifra deve essere 0**
	- **La sua parte intera deve essere minore di 2**
	- (Dato che lavoriamo in binario, date le proprietà della notazione scientifica, posso assumere che il primo bit sia **sempre** 1, quindi posso non metterlo in memoria.)

Esempio 
```
Ipotizziamo base 10
2 cifre esponente
5 cifre mantissa

Numero non normalizzato   Forma normalizzata
0,348                   - 3,8400 * 10^-1
1345                    - 1,3450 * 10^3
64350                   - 6,4350 * 10^4
0,0048                  - 4,8000 * 10^-3
```

I limiti dell'intervallo di rappresentazione sono:
**overflow** se |x| > 9,9999 * 10^99
**underflow** se |x| < 1,0000 * 10^-99
- Con un underflow confondo un valore più piccolo dell'intervallo minimo con 0.
- Cazzo. Ci da tanti tanti problemi soprattutto con divisione, quindi i nostri algoritmi devono tenere conto di questo.

Quindi con un floating point aumentiamo di **ordini di grandezza** l'intervallo di rappresentazione.
Allo stesso tempo la distribuzione degli intervalli non è *fissa*.
-  Quindi vicino allo 0 ho la densità massima, mentre vicino ai massimi di rappresentazione ho la densità minima.
- In genere in questo modo posso avere precisione massima in qualsiasi caso, dato che se tratto valori grandi un errore è più trascurabile.

Per formalizzare:
-  Gli intervalli non hanno tutti la stessa **ampiezza** a causa della finitezza del numero di cifre della mantissa.
	- Vicino alla *condizione di overflow* gli intervalli si fanno sempre più grandi.
	- Vicino alla *condizione di underflow* gli intervalli si fanno sempre più piccoli.
- Quindi gli intervalli non hanno una **distribuzione fissa**.

Cosa succede se dobbiamo fare operazioni con queste rappresentazioni?
- Dato che ogni numero è rappresentato da mantissa ed esponente, per operare due numeri devo traslarli fino a che mi trovo due numero con lo *stesso esponente*.
- In questo caso l'allineamento degli esponenti può dare **effetti indesiderati**, cioè faccio scomparire alcune cifre rappresentative del numero *minore*, quindi vado a *perdere* le cifre meno significative.
	- In sostanza anche se la precisione dei numeri implica che entrambi dobvrebbero avere *5 cifre significative*, nel pratico il numero minore affronta un errore di approssimazione.
	- NB: questo significa che particolarmente divisione con numeri molto piccoli porta facilmente a *overflow*.

### Standardizzazione
Noi utilizzeremo lo standard **IEEE 754**
Propone tre formati numerici
- Singola precisione (32 bit)
- Doppia precisione (64 bit)
- Precisione estesa (80 bit)

Particolarmente in precisione singola divido i bit in questo modo:
```
Segno    |  Esponente          |  Mantissa (omettendo 1 più significativo
         |  (8 bit)            |  (23 bit)
pos 31   |  pos 30 - pos 23    |  pos 22 - pos 0
```
In caso di float in precisione singola codifichiamo esponente in *eccesso 127*.
Ci riserviamo le due rappresentazioni degli estremi per codificare delle situazioni particolari:
- Se esponente e mantissa sono *tutti 0*, codifichiamo 0.
- se esponente sono *tutti 0*, e mantissa sono **diversi** da *tutti 0*, rappresentiamo i numeri **denormalizzati**:
	- Quindi consideriamo il valore dell'esponente come il più piccolo possibile.
	- La mantissa non sottoinitende 1, ma 0.
- Per i numeri **normalizzati** dato che la prima cifra della mantissa è *sempre 1*, non la codifichiamo e la *tralasciamo*. (quindi la mantissa codifica sempre e solo la parte *non intera*)
- Se esponente sono *tutti 1* e mantissa *tutti 0*, rappresentiamo infinito (con segno).
- Se esponente sono *tutti 1* e mantissa **diversa** da *tutti 0*, rappresentiamo Not a Number, cioè un valore indefinito (esempio di un risultato che da **NaN** è una divisione per 0).

| Codifica                  | Esponente          | Mantissa  |
| ------------------------- | ------------------ | --------- |
| **Zeri**                  | 0                  | 0         |
| **Numeri denormalizzati** | 0                  | non zero  |
| **Numeri normalizzati**   | non zero e non 255 | qualunque |
| **Infiniti**              | 255                | 0         |
| **NaN**                   | 255                | non zero  |
### Decodifica e codifica di numeri in precisione fissa
Proviamo a decodificare questo numero:
`11000000101000000000000000000000`
```
1        |10000001                       | 01000000000000000000000
Segno    |Esponente                      | Mantissa
Negativo |Ricordiamo la rappresentazione |
```
Procediamo analizzando ogni sezione
Il *primo bit* codifica il segno, quindi sappiamo che il numero è negativo, ce lo ricordiamo.
Poi analizziamo l'esponente.
Ricordiamo che è codificato in *eccesso 127*.
`10000001` codifica *129*, dato che siamo in *eccesso 127* sottraiamo questi due numeri.
$$
129 - 127 = 2
$$
Quindi l'esponente è *2*.

La mantissa è `01000000000000000000000`, ricordiamo che dato che l'esponente non è *tutti 0*, la mantissa codifica solo la **parte decimale**.
Quindi la rappresentazione pesata è questa:
```
Mantissa           |(1 , ) 0    1    0    0 ... 0    0
Peso (Potenza di 2)| 1    -1   -2   -3   -4 ...
Valore             | 1     0 0.25    0    0 ... 0    0
```
Quindi la mantissa codifica *1,25*.
Il nostro *valore decimale* sarà quindi:
$$
- 1,25 * 2^ {2}
$$

Le operazioni in virgola mobile non soli si complicano ma possono quindi generare *errori di approssimazione*.

Ora facciamo l'inverso
Codifichiamo **8,5** in singola precisione.
Partiamo dal segno, quindi il primo bit sarà *0*.
Passiamo alla codifica di *8,5*.
`8.5` in binario sarà `1000,1`.
```
Base dieci | 8        , 5
Base 2     | 1 0 0 0  , 1
```
Quindi in notazione scientifica abbiamo 
$$
1000,1_{2} *2^{0}
$$
Traslo l'esponente:
$$
1,0001_{2} *2^{3}
$$
Devo quindi codificare esponente e mantissa.
L'*esponente* ricordiamo sia in *eccesso 127*, quindi per codificare `3` devo codificare `127 + 3 = 130`
Quindi l'**esponente** sarà `10000010`.
La **codifica della mantissa** sarà invece `000100000000000000000000`.
Il numero sarà quindi `0` `10000010` `000100000000000000000000`.

Quando scriviamo codice in [[C]] il [[Traduzione del codice C|compilatore]] fa tutto questo processo di conversione dal numero in *base 10* che scriviamo con quello in *precisione fissa*.