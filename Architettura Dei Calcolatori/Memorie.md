I dispositivi di memoria basilari sono **registri e flip-flop**.
Questi ci permettono di leggere e scrivere da un dispositivo, ma una memoria deve essere in grado di, contenendo moli di informazioni *elevate*, **selezionare** la sezione di memoria (la *cella*), su dove operare.

In questo modo posso caratterizzare rispetto alle caratteristiche le memorie, rispetto a
- **Modalità di accesso ai dati**:
	- Sequenziali 
		- I dati sono uno dopo l'altro, per accedere a celle diverse ci metto tempi diversi.
	- Casuali
		- Non cambia il comportamento della selezione della cella rispetto al luogo in cui è immagazinata. 
			- Ci metto sempre lo stesso tempo.
	- *Questo è legato alla tecnologia che si utilizza, quindi ovviamente devo tenerlo in conto nella progettazione dei sistemi*
- **Modalità di selezione dei registri**:
	- Memorie *Indirizzabili*.
	- Memorie *Associative*.
		- Rispetto ad un valore, restituisce un controvalore.
			- Hash map e roba varia.
		- Si usa nelle memorie **cache**.
			- La chiave che mi serve in questo caso *fa parte del dato* e mi permette di *selezionare più facilmente quale dato mettere in cache*.
- **Operazioni consentite**.
	- Memorie a sola lettura.
		- Un esempio è il *firmware* (non in tutti i casi onesto).
	- Memorie a lettura e scrittura.
- **Permanenza dell'informazione memorizzata**.
	- Volatili.
	- Non volatili.
- **Caratteristiche meccaniche dei circuiti di lettura**.
	- Meccanicamente statiche.
	- Meccanicamente dinamiche.
		- ES. Nell' Hard Disc ho un braccio che si muove per leggere le informazioni.

Quando parliamo di memorie ad accesso casuale, posso anche dividere rispetto alla **permanenza dell'informazione**.
Ci serve per fare considerazioni architetturali.
- Statiche - (SRAM)
	- Le informazioni sono immagazinate per un tempo indeterminato.
- Dinamiche - (DRAM)
	- I dati in questo caso possono rimanere immagazinati per *poco tempo*, quindi ho bisogno di fare un **refresh periodico** in cui riscrivo tutti i dati per non perderli.
	- Più lente ma più economiche.

Inoltre posso parametrizzare una memoria RAM rispetto a:
- Capacità
- Tempo di accesso.
	- Quanto tempo ci metto a fare un operazione
	- In genere tempo di richiesta + tempo di lettura/scrittura.

Ovviamente, come abbiamo visto in *fondamenti di informatica*, più una memoria è **capiente**, più è **lenta**.
```
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
     ▲                 ┌──────────────────────────┐                 │    
     │                 │                          │                 │    
     │ Velocità, costo │                          │      Capacità   │    
     │                 │          C P U           │                 │    
     │                 │                          │                 │    
     │                 │  ┌────────────────────┐  │                 │    
     │                 │  │                    │  │                 │    
     │                 │  │   Cache Primaria   │  │                 │    
     │                 │  │                    │  │                 │    
     │                 │  └────────────────────┘  │                 │    
     │                 └──────────────────────────┘                 │    
     │          ┌────────────────────────────────────────┐          │    
     │          │                                        │          │    
     │          │            Cache Secondaria            │          │    
     │          │                                        │          │    
     │          └────────────────────────────────────────┘          │    
     │      ┌────────────────────────────────────────────────┐      │    
     │      │                                                │      │    
     │      │                Memoria Primaria                │      │    
     │      │                                                │      │    
     │      └────────────────────────────────────────────────┘      │    
     │  ┌────────────────────────────────────────────────────────┐  │    
     │  │                                                        │  │    
     │  │                   Memoria Secondaria                   │  │    
     │  │                                                        │  │    
     │  └────────────────────────────────────────────────────────┘  ▼    
```

## Come faccio parlare la memoria con un processore.
In una memoria abbiamo tipicamente un blocco in cui sono le informazioni, e due **registri di riferimento**, uno in scrittura e uno in lettura e scrittura.
Con il registro *MAR*, mi interfaccio con l'indirizzo.
Con il registro *MDR*, mi interfaccio con i dati su un indirizzo.

Inoltre uso i segnali di controllo *di abilitazione*, che abilita lettura e scrittura; e di controllo **READ/WRITE**, che ci permette di selezionare l'operazione da svolgere.

Fondamentalmente, in lettura ho bisogno di mettere l'indirizzo in `MAR`, e il dispositivo mette il dato in `MDR`.
Mentre in scrittura, metto sia dato in `MDR` sia indirizzo in `MAR`, e il dispositivo immagazina il dato.
Questo significa che nel `MDR`, ho dei fili logici che vengono usati in maniera diversa rispetto a quello che voglio fare, quindi ho bisogno di una [[Logica 3-state e memorie]] per realizzarlo.

Attenzione che esistono memorie **sincrone** e **asincrone**, ovviamente nelle sincrone ho bisogno di un *segnale di clock* come terzo segnale di controllo.