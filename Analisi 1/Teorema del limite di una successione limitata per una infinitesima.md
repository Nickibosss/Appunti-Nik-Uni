### Enunciato
Se $a_{n}$ é una successione limitata e $b_{n}$ é una successione infinitesima, allora il prodotto tra le due é anch'essa infinitesima.

#### Dimostrazione
Applichiamo la definizione di successione limitata ad $a_{n}$, quindi significa che esiste un numero grande $M$ tale che $\forall n\in \mathbb{N}$, $|a_{n}|\leq M$.

Inoltre applichiamo la definizione di successione limitata a $b_{n}$, quindi diciamo che per ogni $\epsilon>0$ esiste un indice $\nu$ tale che $\forall n > \nu$:

$$
	|b_{n}|<\epsilon
$$

Facciamo il prodotto dei due e maggioriamo, sapendo che $|a\cdot b|=|a|\cdot|b|$:

$$
	|a_{n}\cdot b_{n}| = |a_{n}|\cdot|b_{n}| \leq M\cdot |b_{n}|<M\cdot\epsilon
$$

Sapendo che ogni multiplo di epsilon puó essere definito come $\epsilon$ stesso, abbiamo dimostrato che il prodotto di queste successioni, per ogni $n$ maggiore di $\nu$.

L'esempio classico é:

$$
	\lim_{ n \to \infty } \frac{\sin n}{n}
$$

Dato che il seno é limitato tra $-1$ e $1$, e la funzione $\frac{1}{n}$ é infinitesima, allora tutta la funzione  é infinitesima.