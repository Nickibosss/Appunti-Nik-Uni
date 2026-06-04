### Enunciato
Ogni successione convergente é **limitata**.

##### Che significa?
Se $a_{n} \to a$, allora esiste un numero grande $M$ tale che ogni termine della successione é minore di $M$ in valore assoluto.
In matematichese possiamo scrivere che:

$$
	|a_{n}|<M \ \ \forall n \in \mathbb{N}
$$

Ricordiamo che esistono anche successioni limitate non regolari come $a_{n}=(-1)^{n}$, che non ammettono limite, ma siamo sicuri che sono minori in valore assoluto di $M>1$.
#### Dimostrazione
Supponiamo che $a_{n} \to a$, la definizione di limite vale $\forall\epsilon >0$, quindi dato che posso scelgo $\epsilon=1$ per comoditá.

A questo punto applichiamo la definizione ricordando $\nu$.

$$
	|a_{n} -a|<1, \ \ \ \forall n>\nu
$$

Voglio usare la disuguaglianza triangolare, quindi aggiungo e tolgo $a$ a $a_{n}$:

$$
	|a_{n}| = |(a_{n}-a) +a| \underset{ \text{  per la disuguaglianza triangolare } }{ \implies  } |a_{n}|<|a_{n}-a|+|a| < 1+|a|\ \ \ \forall n>\nu
$$

