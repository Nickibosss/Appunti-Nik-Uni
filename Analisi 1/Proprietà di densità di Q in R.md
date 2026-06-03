Semplicemente, l'insieme dei numeri razionali $\mathbb{Q}$ é denso nell'insieme dei numeri reali $\mathbb{R}$.
Questo significa che scelti qualsiasi due numeri $y,x \in \mathbb{R}$, esistono *infiniti* numeri razionali $c\in \mathbb{Q}$.

Si dimostra in maniera scema e complicata, ma collegandosi al principio di archimede:
Se $\forall x \in \mathbb{R} \ \ \exists n \in \mathbb{N} : n>x$, allora significa che esistono infiniti numeri $\frac{1}{n}$ minori di qualsiasi numero piccolo $\epsilon \in \mathbb{R}$.
Se definiamo la differenza tra $y$ e $x$ come $d=y-x$ per trovare un numero compreso tra $y$ e $x$ bisogna aggiungere un numero inferiore a $d$ a $y$ (assumendo che  $x<y$).
Per archimede sappiamo che per quanto possa essere piccolo $\epsilon=d$, esiste *almeno un* $\frac{1}{n}$ minore.

A questo punto manca solo trovare il numeratore $m$. Lo andiamo a cercare nell'insieme dei multipli di $\frac{1}{n}$, ponendolo come $\frac{m}{n}$, e di nuovo dato archimede sappiamo che é un insieme illimitato. Questo quindi significa che esiste un $m$ sufficientemente grande tale che:

$$
\frac{m}{n}>x
$$

Se scegliamo il primo $m$ che rispetta questa condizione, siamo sicuri che $m-1$ non la rispetti, quindi siamo sicuri che:
$$
	\frac{m-1}{n} \leq x
$$

Facendo il minimo comune multiplo:
$$
	\frac{m}{n} \leq x+\frac{1}{n}
$$

Perfetto! Ora abbiamo tutte le disequazioni che ci servono per mettere insieme tutto.

Ci ritroviamo quindi, mettendo insieme tutto:
$$
	x < \frac{m}{n} \leq x + \frac{1}{n} < y
$$

Abbiamo trovato il nostro numero razionale $q=\frac{m}{n}$ intermedio tra $x$ e $y$!

### Diverse densitá
Quindi sappiamo che tra due numeri reali esiste **almeno un** numero razionale.
Significa che $\mathbb{Q}$ é denso in $\mathbb{R}$, ma anche $\mathbb{R}$ é denso in se stesso, **infinitamente denso**.
Ovviamente se sottraiamo $\mathbb{Q}$ a $\mathbb{R}$ otteniamo l'insieme dei numeri irrazionali. Sapendo che ci sono infiniri reali tra due reali, ma solo *almeno un* razionale tra due reali, esistono **infiniti** irrazionali tra due reali.