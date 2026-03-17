Sappiamo che il piano numerico lo indichiamo come $R^{2}$ è l'insieme di tutte le coppie $(x,y)$, che rappresentiamo sul grafico cartesiano.
Quello che andiamo a rappresentare con il punto $P$ possiamo quindi descriverlo come un **vettore**.
Come su *algebra e geometria* sono *n-uple* ordinate.

Quindi in questo caso abbiamo una **corrispondenza** tra oggetto *geometrico* e oggetto *algebrico*.

Nel caso *algebrico* ho un vettore che ha certi componenti $v_{1};v_{2}$ quindi sommarli significa **sommare i componenti**. 
Sappiamo che è possibile anche effettuare uno scalare $\lambda$ per un vettore $\bar{v}$.
In questo caso *moltiplico* $\lambda$ per i componenti $v_{1}$ e $v_{2}$.

>[!NOTE] Un caso specifico
> Quando $\lambda$ è $-1$ ottengo l'*opposto* del vettore

In questo caso possiamo riprendere il concetto di **spazio vettoriale**, definito dalla terzupla $(R^{2}, + , \cdot)$.
Ricordiamo che le operazioni sono **operazione binaria interna $+$** e **operazione binaria esterna $\cdot$**.

### Modulo e norma di un vettore
Dobbiamo trovare effettivamente cosa sia il **modulo** e la **norma** di un vettore.
Ricordiamo che quando la norma è uguale a 1 si chiama *versore*.

Calcoliamo il modulo di un vettore in questo modo:
$$
|\bar{v}| = \sqrt{ v_{1}^{2}+v_{2}^{2} } \text{ chamato anche norma} ||\bar{v}||
$$
Ricordiamo che effettivamente
$$
\sqrt{ x^{2} } = |x| \text{ NON } x
$$

Inoltre posso trovare la *distanza di due punti* allo stesso modo, dato che non è altro che **la differenza del modulo del vettore $\bar{PQ}$**.

### Prodotti tra vettori
Tra *vettori* possiamo definire due tipi di prodotti:
- Prodotto vettoriale (tra due vettori) in questo modo: 
- Prodotto scalare (sopra) il cui risultato è uno scalare con modulo in questo modo: $\bar{v}\cdot \bar{w} = v_{1}\cdot w_{1} + v_{2}\cdot w_{2}$.

Dimostriamo il prodotto scalare.
$$
\bar{v} \perp \bar{w} (doppi a implicazione) \bar{v}\cdot \bar{w}=0
$$
Di entrambi i vettori ho coefficiente angolare di questo genere:
$$
m = \frac{v_{2}}{v_{1}}
$$
Sappiamo che due rette sono perpendicolari se **il prodotto dei coefficienti angolari è $-1$**.
Quindi:
$$
\frac{v_{2}}{v_{1}} \cdot \frac{w_{2}}{w_{1}} = -1
$$
Se vado a fare il minimo compune multiplo vedo che:
$$
v_{2}\cdot w_{2} =  -v_{1}\cdot w_{1} \implies v_{1}\cdot w_{1} + v_{2} \cdot w_{2} = 0
$$

### Disuguaglianza di Cauchy-Shwarz
Esaminiamo anche la **disuguaglianza di Cauchy-Shwarz**:
$$
\text{ siano } \bar{v_{1}} , \bar{v_{2}} \in R^{2}, |v_{1}\cdot v_{2}| \leq |\bar{v_{1}}| \cdot   |\bar{v_{2}} |
$$
Vediamo la dimostrazione:
Caso banale -> uno dei vettori o entrambi sono nulli:
$$
\bar{v_{1}} = \bar{0} \text{ o } \bar{v_{2}} = \bar{0} \implies 0 = 0
$$
altrimenti:
$$
\bar{v_{1}} = (x_{1}, y_{1})
$$
$$
\bar{v_{2}} = (x_{2},y_{2})
$$
Vado a fare il prodotto quadrato
$$
|\bar{v_{1}} + \alpha  \bar{v_{2}} | ^{2} = (v_{1}+\alpha v_{2}) \cdot (v_{1} + \alpha v_{2}) = v_{2} \cdot v_{2} + \alpha v_{1}\cdot v_{2} + \alpha v_{2} \cdot v_{1} + \Delta^{2} v_{2} \cdot v_{2}
$$
Calcolo tutto e ottengo:
$$
(v_{1}\cdot v_{2})^{2} - | \bar{v_{2}}|^{2} \cdot |\bar{v_{1}}|^{2} \leq 0
$$
QUINDI necessariamente torniamo alla nostra definizione.

### Intorni dei punti
In analisi 1, parliamo di intorni facendo riferimento a un **intervallo aperto** al cui interno cade $x_{0}$. Inoltre preferiamo gli **intorni circolari**, cioè quelli in cui $x_{0}$ è al centro dell'intervallo.

Anche in analisi 2 succede la stessa cosa, ma in questo caso **in due dimensioni**, cioè a modo di *cassino*.

In questo caso, in analisi 2, posso scegliere se questo intorno sia **rettangolare**, o **circolare** rispetto alle circostanze.

> [!NOTE] N.B.
> In polare preferiamo un intorno *circolare*.

Se $P(a;b) \in \mathbb{R}^{2}$, si chiamano **intorno rettangolare** di $P$ l'insieme di punti $(x,y) \in \mathbb{R}^{2}$ tali chie $|x-a| < h, |y-b| < k$ con $h,k \in \mathbb{R}^{2} \neq 0$.

Per gli **intorni circolari** non ho $k$, ma $h$ in tutti e due i casi.

### Sottoinsieme limitato e illimitato
Un sottoinsieme $E\leq \mathbb{R}^{2}$ si dice **limitato** se $\exists$ un **dominio circolare** di centro arbitrario che contiene $E$. *Viceversa*, si dice che $E$ è **illimitato**.

### Intorno di $\mathbb{R}^{2}$
Chiamo un intorno di $P \in \mathbb{R}^{2}$ ogni sottoinsieme di $\mathbb{R}^{2}$ contenente un intorno di $P$ **sufficientemente piccolo**.

Ma quindi, cosa è l'intorno di *infinito*?
Semplicemente un intorno che contiene tutti i punti esterni ad un conveniente intorno circolare dell'*origine* $O (0;0)$.
Quindi è un *qualcosa* che spazia *avvicinandosi* ai bordi del piano.

### Punti di accumulazione
Un punti $P$ si dice **di accumulazione** per un insieme $E\leq \mathbb{R}^{2}$ se in ogni intorno di $P$ cadono punti di $E$ distinti da $P$.
Quindi **naturalmente** possono appartenere o non ad $E$.

Tradotto: cade **almeno un punto** dell'insieme che non è $P$.

Se il punto $P \in E$ *appartiene* ma *non è* di accumulazione, allora è un **punto isolato**.

Quindi in *analisi 2*, se prendo un insieme di punti fatto da *intervalli*, ho punti di accumulazione.
Se invece prendo una **nuvola di punti** (cioè un insieme di punti sparsi non denso), posso *restringere* **infinitamente** l'intorno finchè non trovo un intorno in cui **non ho** punti nell'insieme.

### Teorema di Bolzano
> [!important]
> Ogni insieme limitato contienente infiniti punti, ammette almeno un punto di accumulazione.

### Insieme complementare
Si chiamano **insieme complementare** di un insieme $E \in \mathbb{R}^{2}$ l'insieme di punti di $\mathbb{R}^{2}$ che *non appartengono* ad $E$.
Ovviamente il complementare di $\mathbb{R}^{2}$ è l'insieme vuoto, il complementare dell'insieme vuoto è $\mathbb{R}^{2}$

Se $E$ è aperto, allora il suo complementare è chiuso e viceversa.

### Punti interni e esterni
Siano $P(x;y) \in \mathbb{R}^{2}$ e sia $E\leq \mathbb{R}^{2}$;
- $P$ è **interno** ad $E$ se e solo se $\exists$ un intorno circolare di $P$ che contiene **esclusivamente** punti di $E$.
- $P$ è **esterno** ad $E$ se e solo se $\exists$ un interno circolare di $P$ che **NON** contiene alcun punto di $E$. 
- Se $P$ non è **nè esterno nè interno** allora si dice *di frontiera*.
- Ogni punto di frontiera di $E$ è un punto di frontiera del *complementare* di $E$.
- Si chiamano **frontiera** di $E$ l'insieme di tutti i punti di frontiera di $E$.
- Se $E$ è un sottoinsieme di $\mathbb{R}^{2}$ non vuoto e non uguale ad $\mathbb{R}^{2}$, allora $E$ ha **almeno un** punto di frontiera.
- Se $E$ è un sottoinsieme aperto, **non contiene** alcun punto di frontiera.
- Se $E$ è un sottoinsieme chiuso, **contiene tutta** la sua frontiera.

### Insieme internamente connesso
Un insieme $E$ di punti del piano dotato di punti interni si dice **internamente connesso**, se *comunque si prendano* punti $P$ e $Q$ esiste una *poligonale congiungente* $P$ con $Q$ tutta costituita da punti *interni* ad $E$, fatta al più eccessione dei suoi esterni $P$ e $Q$.
Quindi se presi due punti interni ad una figura, riesco a trovare *almeno una* linea spezzata che li collega, fatta **esclusivamente** di punti che formano la figura.

**vedi esempio di cerchi concentrici**

Quindi in parole povere:
- Se posso fare **almeno una** spezzata che connette **qualsiasi punto** all'interno della figura *descritta* dall'insieme, l'insieme è *internamente connesso*.
- Altrimenti, no.

### Campo piano
Si chiama **campo piano** un insieme di punti del piano che sia *aperto* e *internamente connesso*.

> [!example] ESEMPIO:
> $1<x^{2}+y^{2}<4$ è un campo piano
> $$
> \begin{cases}
> x^{2}+y^{2} < 1 \\
> (x-3)^{2} + y^{2} <1
> \end{cases}
> $$
> Non è un campo piano dato che, anche se *è aperto*, NON é internamente connesso.

### Dominio piano
Chiamo **dominio piano** ogni insieme di $\mathbb{R}^{2}$ che sia **chiuso** e tale che *ogni suo punto* sia punto di accumulazione di punti interni.

### Insieme continuo
Un **insieme chiuso** si dice *continuo* se non può mai risultare *unione di due insiemi chiusi*, non vuoti e disgiunti.

#### Proposizione
Ogni insieme di $E$ chiuso $\dots$ mi sono perso