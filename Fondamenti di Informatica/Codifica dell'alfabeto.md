#codifica_e_rappresentazione #teoria #università
# Standard di codifica
## EBCDIC
Esistono diversi *standard* per codificare i caratteri di alfabeto.
Un esempio è lo standard **EBCDIC**:
Utilizza *8 bit*, quindi rappresentiamo i caratteri come due caratteri *esadecimali*.
Possiamo distinguere varie porzioni nello standard:
- Caratteri stampabili (a,b,c,$,&,£)
- Caratteri speciali
- Caratteri di controllo
Lo standard **EBCDIC** è stato proposto da IBM a metà degli anni 60.
## ASCII
Uno standard successivo è quello **ASCII** (American Standard Code for Information).
Utilizza *7 bit* e la codifica è espressa sempre in esadecimale, quindi codifica *128 informazioni*.
Questo standard codifica solo i simboli utili all'*inglese americano*, quindi mancano simboli necessari a diversi alfabeti. 

Come  si è pensato a risolvere il problema?
Un primo metodo è utilizzare un *ottavo byte*.
Questi standard sono dettati da **ISO 8859**, e presenta standard diversi rispetto ai gruppi di utenti.
Quindi non risolve effettivamente il problema del *multilinguismo*.

Sostanzialmente questo gruppo di codifiche per i *7 byte* ASCII rimangono invariati, mentre con il **bit più significativo** pari a `1` codificano altri valori.

## Unicode
Lo standard che risolve il multilinguismo è **Unicode**.
I formati **UTF** usano 8, 16 o 32 bit.
Le *rappresentazioni unicode* si rappresentano in livelli. Per ogni livello esistono "*blocchi*", i quali codificano diverse categorie di simboli.


