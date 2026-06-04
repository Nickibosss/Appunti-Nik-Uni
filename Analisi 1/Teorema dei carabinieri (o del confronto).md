### Enunciato
Siano $a_{n}, b_{n}$ e $c_{n}$ tre successioni tali che:

$$
	a_{n} \leq b_{n} \leq c_{n}
$$

e:

$$
	\lim_{ n \to \infty } a_{n} = \lim_{ n \to \infty } c_{n} = a
$$

Allora anche $\lim_{ n \to \infty }b_{n} =a$

#### Dimostrazione
Applichiamo la definizione di limite di successione e consideriamo $\nu_{1}$ e $\nu_{2}$ come i numeri che $\forall\epsilon>0$, rispettivamente:

$$
	\begin{gathered}
		\forall n>\nu_{1}, \ \ \ |a_{n}-a|<\epsilon \\
		\forall n>\nu_{2}, \ \ \ |c_{n} - a| < \epsilon
	\end{gathered}
$$

Considerando il maggiore tra i due, quindi  ponendo $\nu= \text{ max}\{\nu_{1},\nu_{2}\}$, siamo sicuri che entrambe le disuguaglianze siano valide.
Quindi mettendo tutto insieme:

$$
\begin{gathered}
	a-\epsilon< a_{n} \leq b_{n}\leq c_{n} < a+\epsilon, \ \ \ \forall n>\nu \\
	\text{Quindi:}\\
	a-\epsilon< b_{n}< a+\epsilon \ \ \ \forall n>\nu
\end{gathered}
$$

Che in parole povere  é la definizione di $\lim_{ n \to \infty }b_{n}=a$, infatti:

$$
	\forall n>\nu, \ \ \ \ |b_{n}-a| < \epsilon
$$

Con questo possiamo tranquillamente dimostrare il [[Teorema del limite di una successione limitata per una infinitesima]], e inoltre dimostrare che se $a_{n}\leq b_{n}, \ \ \  \forall n>\nu$, e $\lim_{ n \to \infty }a_{n}=\infty$, allora $\lim_{ n \to \infty }b_{n}=\infty$.
