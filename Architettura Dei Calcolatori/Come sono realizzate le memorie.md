---
id: Come sono realizzate le memorie
aliases: []
tags: []
---

Una [[Memorie|memoria]] è fondamentalmente formata da diverse celle.
Quando vado a selezionare un *indirizzo*, ho bisogno di abilitare la cella che voglio scegliere, quindi ho bisogno di un *decodificatore*.
Una volta abilitata, in lettura è sufficiente dato che grazie alla [[Logica 3-state e memorie]], posso far uscire tutte le celle sulla stessa linea dati.
In scrittura invece ho bisogno di un DMUX che mi permette di immagazinare e un MUX che mi da il dato esterno.

Il segnale di scrittura di una singola cella entra nel DMUX, quello in scrittura nel MUX.

In generale uso un architettura a celle, perchè mi permette di riutilizzare l'architettura di una cella, ripetendola n volte.
Quindi metto insieme più moduli per arrivare ad una capacità maggiore. Quì ho bisogno di un altro MUX e DMUX.

[Vedi da pdf, servono gli schemi (o da libro onesto)].
