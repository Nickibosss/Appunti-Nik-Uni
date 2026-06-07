### Enunciato
Sia $f(x)$ una funzione continua in un intervallo chiuso e limitato $[a,b]$. Se ai due estremi la funzione assume valori di segno opposto, allora esiste **almeno un punto** $x_{0}\in[a,b]$ tale che $f(x_{0})=0$
#### Dimostrazione\
Usiamo il **metodo di bisezione**.
Prendiamo il nostro intervallo $[a,b]$ e troviamo il suo punto medio $c= \frac{a+b}{2}$. 
In questo modo ci troviamo in due possibili stati:

- $f(c)=0$.
	- Abbiamo fatto, infatti $x_{0}=c$ e la dimostrazione termina qua.
- $f(c)\neq 0$.
	- In questo caso scegliamo tra i due sottointervalli $[a,c]$ e $[c,b]$ quello dove la funzione cambia segno agli estremi e lo definiamo $[a_{1},b_{1}]$, e in questo caso continuiamo allo step successivo.

Se ripetiamo questo processo infinitamente costruiamo due successioni $a_{n}$ e $b_{n}$. Essendo gli estremi dei nostri sottointervalli, siamo sicuri che $a_{n}$ é strettamente crescente e $b_{n}$ é strettamente decrescente.
Inoltre, dato che siamo sicuri che sono di segni alterni (o $0$), siamo sicuri anche che:

$$
	\forall n\in \mathbb{N}, \ \ \ f(a_{n})\leq0,f(b_{n})\geq0 \ \ \text{o viceversa.}
$$

Inoltre siamo sicuri che la lunghezza dell'intervallo dimezza ad ogni passaggio, infatti $|a_{n}-b_{n}| = \frac{|a-b|}{2^{n}}$.
Questo significa che per $n \to \infty$, le due successioni devono convergere allo stesso limite $x_{0}$.
Dato che $f$ é continua, significa che vale la condizione dei segni alterni, quindi:

$$
	\begin{cases}
		f(a_{n})\leq 0 \\
		f(b_{n})\geq 0
	\end{cases}
	\to
	\begin{cases}
		f(x_{0}) \leq 0 \\
		f(x_{0}) \geq 0
	\end{cases}
	\to
	0\leq f(x_{0})\leq 0 \to f(x_{0})=0
$$
BOOM! risolto.