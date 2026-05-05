Fino ad ora abbiamo lavorato su sistemi che hanno come imput *due valori*. Ma questa architettura ha un difetto, il dispositivo **non può essere spento**. Lavora continuamente.
Ovviamo a questo tramite la logica **3-state**.
In questo caso abbiamo tre stati:
- Livello logico alto, (1)
- Livello logico basso, (0)
- Stato ad *alta impedenza*.
	- Si comporta come se fosse **disconnessa**.
In questo caso ogni porta logica porta con se **un signale di abilitazione**. In questo caso fa in modo che qundo il dispositivo è *disabilitato*, non ho come output un *livello logico basso*, ma un **terzo segnale valido**.

In questo modo posso fare in modo di comporre tra di loro i dispositivi, disabilitandoli eventualmente, senza avere comportamenti *illeciti*.
Questo ci porta a poter anche **collegare fili di uscita insieme**! Cosa totalmente non ammissibile in logica booleana pura.

Attenzione però che se abilitiamo due buffer con uscita collegata, abbiamo un *output indefinito*, e la macchina *va in errore*.

Cosa ci permette di fare? Progettare le macchine in maniera **molto più efficiente**. Esempio sarebbe un multiplexer.

Quando in un circuito l'output è *ad alta impedenza* da tutti i buffer collegati, anche il **segnale di uscita** è *ad alta impedenza*.

Utile anche nelle architetture delle [[Memorie]].