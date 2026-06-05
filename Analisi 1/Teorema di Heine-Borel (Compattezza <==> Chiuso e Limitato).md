### Enunciato
Un sottoinsieme di $\mathbb{R}$ é compatto solo se é **chiuso e limitato**.

#### Dimostrazione
##### Chiuso e limitato ==> compatto
Applichiamo la definizione.
Sia $X$ un insieme chiuso e limitato. Sia una successione totalmente contenuta in $X$ $a_{n}$. Dato che $X$ é chiuso e limitato, anche $a_{n}$ é una successione limitata.
Per il [[Teorema di Bolzano-Weierstrass]] da ogni successione limitata possiamo estrarre una sottosuccessione $a_{n_{k}}$ che converge ad un punto $l$.
Per definizione, $l$ é un punto di accumulazione, e dato che $X$ é chiuso, per definizione deve contenere tutti i suoi punti di accumulazione. Quindi necessariamente $l \in X$.
Dato che abbiamo trovato un estratta di una sottosuccessione generica che é interna all'insieme, esso é **compatto**.

##### Compatto ==> chiuso e limitato
Per assurdo, immaginiamo che il nostro $X\subset \mathbb{R}$ compatto sia illimitato.
Allora potrei creare una successione che diverge infinitamente. Significa che non potrei estrarre una sottosuccessione che punta ad un numero reale, quindi non puó essere compatto. Assurdo

Analogamente, immaginiamo che $X$ sia aperto. Significherebbe che deve esistere un punto di accumulazione $x_{0}$ esterno all'insieme. Quindi, potrei creare una sottosuccessione che converge a $x_{0}$, negando la compattezza.