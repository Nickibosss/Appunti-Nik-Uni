Ricordiamo che in questa sezione stiamo parlando di successioni.

### Enunciato
Una successione convergente non puó avere **due limiti distinti**. Ricordiamo che in questo caso ci riferiamo a $\lim_{ n \to \infty }a_{n}$.

#### Dimostrazione
Dato che vogliamo dimostrare che esiste un solo limite, quindi che é *unico*, procediamo per assurdo.
Supponiamo che la nostra successione $a_{n}$ abbia due limiti distinti $a,b$ e supponiamo che $a\neq b$.
Usando la definizione di limite di successione con $n \to \infty$, sappiamo che esiste un numero grande $\nu$ tale che per ogni indice $n>\nu$ allora $|a_{n} -a| <\epsilon$. Significa che ad un certo punto, dato che $a_{n}$ tende ad $a$, quando superiamo l'indice $\nu$, la successione si avvicina ad $a$, di una quantitá minore di $\epsilon$.

Dato che posso scegliere io $\epsilon$, me lo imposto in modo da darmi una mano, pari alla metá della differenza tra $a$ e $b$.

$$
	\epsilon = \frac{|a-b|}{2}
$$

Tramite la definizione di limite messa precedentemente, e dato che presupponiamo che $a_{n} \to a$, allora esiste un indice $\nu_{1}$ tale che *per ogni* $n>\nu_{1}$ *i termini della succesisone sono vicini ad $a$*. Quindi:

$$
	\forall n>\nu_{1}, \ \ |a_{n}-a| <\epsilon
$$

$$
	\text{leggi: la differenza tra il termine della successione e il suo limite } a \text{ per ogni indice maggiore di } \nu\text{ e` minore di } \epsilon
$$

Analogamente, dato che per assurdo abbiamo pressupposto che $a_{n} \to b$, allora esiste un indice $\nu_{2}$ tale che *per ogni* $n>\nu_{2}$ *i termini della successione sono vicini a* $b$. Quindi:

$$
	\forall n>\nu_{2} \ \ |a_{n}-b|<\epsilon
$$

Ora scegliamo un $n$ maggiore di entrambi in modo che valgano entrambe le equivalenze:

$$
	\begin{cases}
		\nu = \text{max}\{\nu_{1},\nu_{2}\} \\
		n > \nu
	\end{cases} 
$$
A questo punto possiamo dire che:

$$
	\forall n > \nu \ \ \ |a_{n} -a | + |a_{n} -b| < \epsilon + \epsilon \implies |a_{n} -a| + |a_{n} -b| < 2\epsilon
$$

Ma se $\epsilon = \frac{|a-b|}{2}$, allora $2\epsilon = |a-b|$, quindi, secondo le proprietá del valore assoluto $|a-a_{n}| + |a_{n}-b| < |a-b|$, e togliendo e sommando $a_{n}$ otteniamo che:

$$
	|(a-a_{n}) + (a_{n}-b)| < |a-b| \implies |a-b| < |a-b|
$$

Che é impossibile.