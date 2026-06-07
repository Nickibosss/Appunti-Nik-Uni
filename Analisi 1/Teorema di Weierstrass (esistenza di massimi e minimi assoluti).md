#### Preambolo
Se una successione $a_{n}$ tende a $a$, allora ogni sua estratta $a_{n_{k}}$ tende a $a$.

### Enunciato
Sia $f(x)$ una funzione continua in un intervallo chiuso e limitato $[a,b]$. Allora $f$ ammette in tale intervallo massimo e minimo assoluti.
In matematichese, tenendo in conto le nostre presupposizioni su $f(x)$:

$$
	\exists x_{1},x_{2}\in [a,b] : f(x_{1})\leq f(x)\leq f(x_{2}), \ \ \ \ \forall x \in[a,b]
$$

#### Dimostrazione
Poniamo $M$ come il $\text{sup}$ dei valori di $f(x)$ in $[a,b]$.  Quindi abbiamo $f(x)\leq M , \ \ \forall x \in [a,b]$. 
Costruiamo una successione $x_{n}$ in modo che le immagini di $x_{n}$ tendano a $M$. 
Lo facciamo ponendo $\epsilon$ a $1/n$. Se $M$ é il sup allora per il [[Teorema di esistenza dell'estremo superiore e inferiore]], é sicuro che nel momento che sottraiamo $\epsilon$ a $M$, esiste almeno un $x$ tale che $f(x)>M-\epsilon$. Avendo scelto $\epsilon$ in maniera comoda, allora siamo sicuri che:

$$
	M -\frac{1}{n}<f(x_{n})\leq M
$$

$M- \frac{1}{n}$ tende a $M$, quindi per il [[Teorema dei carabinieri (o del confronto)]], la successione delle immagini di $x_{n}$ tende anch'essa a $M$.

Ora, sapendo che l'intervallo é limitato, per [[Teorema di Bolzano-Weierstrass]], Siamo sicuri che esiste una sottosuccessione di $x_{n}$ che definiamo $x_{n_{k}}$ che tende a un punto $x_{0}\in[a,b]$.

Dato che $f$ é continua, significa che, dato $x_{n_{k}}\to x_{0}$, $f(x_{n_{k}})\to f(x_{0})$.
Dato che $f(x_{n})\to M$, $f(x_{n_{k}})$, essendo la successione delle immaggini di una *sottosuccessione* di $x_{n}$, tende anch'essa a $M$. Ma quindi, $x_{0}=M$. Significa che $M$ non é un valore superiore a tutta la funzione, ma un valore assunto da essa, Il massimo assoluto.