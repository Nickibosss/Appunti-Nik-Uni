### Enunciato
Sia $a_{n}$ una successione tale che $\lim_{ n \to \infty }a_{n} = a$. Se il limite é strettamente maggiore di zero allora esiste un indice $\nu$ tale che $\forall n >\nu$ risulta $a_{n}>0$.

#### Dimostrazione
Dato che $a>0$ allora possiamo scegliere $\epsilon=\frac{a}{2}$.
Siamo sicuri in questo modo che $\epsilon>0$.

A questo punto possiamo essere sicuri che esiste un $\nu$ tale che qualsiasi $n$ maggiore di esso avvicini $a_{n}$ ad $a$ di una quantitá minore di $\epsilon$.
Quindi:

$$
	\forall n>\nu, \ \ \ \ |a_{n}-a|< \frac{a}{2}
$$

Quindi possiamo dire tranquillamente, riordinando, che:

$$
	a-\frac{a}{2} < a_{n} <a+\frac{a}{2}, \ \ \ \ \forall n > \nu
$$

Ora siamo sicuri che $a-\frac{a}{2}$ é minore di $a_{n}$, quindi, svolgndo e riordinando:

$$
	a_{n} > \frac{a}{2}, \ \ \ \ \forall n > \nu
$$

E sapendo che $a$ é un numero positivo, anche $a_{n}$ é un numero positivo, a partire dall'indice $\nu$.