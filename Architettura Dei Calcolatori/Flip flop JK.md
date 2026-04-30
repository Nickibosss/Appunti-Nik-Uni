---
id: Flip flop JK
aliases: []
tags: []
---

Un flip flop JK ha due ingressi:
- Un ingresso J, e un ingresso K, anche se in genere abbiamo anche l'ingresso di abilitazione.
- Un valore di uscita.
Questa macchina ha un comportamento interessante:
- Quando J=K si comporta come un flip flop T
	- Quando hanno entrambi il valore alto, **commuta**.
- Quando J!=K si comporta come un flip flop RS

Dobbiamo sempre progettare tenendo in mente il fatto che effettivamente, avendo tre segnali, **dobbiamo considerare tre bit**.
Ma quando andiamo a ragionare sul comportamento *della macchina*, in realtà **tutti i flip-flop** possiamo progettarli pensando al bi-equivalente. Quindi trasformando ad un altro tipo di flip-flop.

Qui la tabella carissima dei valori:

Ovviamente dipende tutto dal segnale di abilitazione, QUANDO SI ABBASSA, devo stare attento al *valore* di J,K dato che se ho una variazione devo considerare se **fare una commutazione** al prossimo fronte di salita.

Questo perchè il flip-flop verifica soltanto al **fronte di salita** del segnale di abilitazione, quindi mentre è alto le variazioni non hanno effetto sull'uscita.

Ovviamente quando *sia* J *che* K sono alti al segnale di abilitazione, devo prima **controllare** il valore memorizzato per poi cambiarlo.

