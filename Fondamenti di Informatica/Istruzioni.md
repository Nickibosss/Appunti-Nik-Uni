#università #architettura #teoria #roba_complicata
Una istruzione *di basso livello* è una operazione semplice messa a disposizione dalla CPU.

La lunghezza di un instruzione dipende dalla CPU e sono definite da un codice binario definita dal linguagigo macchina.
In maniera pratica è una sequenza di bit che viene interpretata dalla CU, e potrebbe essere divisa in questo modo:
```
Codifico il codice operativo nei primi quattro bit.
Codifico il modo di indirizzamento nei due successivi.
Codifico gli operandi, quindi magari quali sono gli indirizzi, oppure dove trovare gli operandi, nei restanti bit.
```
In generale non è detto che le istruzioni abbiano la stessa lunghezza, come non è detto che gli operandi hanno stessa lunghezza.

### Decodifica delle istruzioni
Usiamo due tipi di logica per decodificare
- **Logica Cablata**.
	- Esiste una logica di controllo *direttamente implementata* da circuiti logici fisici, cioè da una rete fisica di porte logiche e decoder. 
	- Il problema di questo approccio è che un qualsiasi minimo cambiamento della logica del processore necessita di un cambiamento totale dell'architettura fisica.
- **Logica Microprogrammata**.
	- In questo caso scompongo ogni istruzione in *micro-istruzioni*, E in questo caso ho una arrchitettura composta: nella CPU è come se ci fosse una micro-cpu che decodifica e interpreta le istruzioni e poi attiva i segnali di attivazione.
	- In questo caso ho la libertà di "programmare" la gestione delle istruzioni, senza dover necessariamente cambiare l'architettura fisica, quindi questo approcio è più **scalabile**.

### Forma delle istruzioni
Esistono due filosofie sulla progettazione dei processori:
- CISC
	- L'architettura CISC utilizza una serie di istruzioni più *potenti*, in maggior quantità e *più complesse*.
	- Il programma risulta più *semplice da scrivere*.
	- Il programma risulta più *difficile da progettare*.
- RISC
	- L'architettura RISC ha un *set di istruzioni* più **ridotto ed essenziale**.
	- Il programma risulta più *complesso*.
	- Il programma risulta più *facile da progettare*.
	- Avendo istruzioni meno complicate, ci mettono meno tempo complessivo, questo mi permette di fare processi di *multithreading*, l'architettura è più efficiente.

Storicamente, la maggior parte dei processori era di tipo **CISC**, ma nel mondo di oggi con il lancio della architettura **ARM**, si sta diffondendo nuovamente l'approccio **RISC**.

