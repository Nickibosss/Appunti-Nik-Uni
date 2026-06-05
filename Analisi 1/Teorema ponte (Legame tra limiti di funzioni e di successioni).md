#### Preambolo
Probabilmente uno dei teoremi piú importanti che studiamo. Spaventosamente utilizzato.

### Enunciato
Sia $f$ una funzione definita in un insieme $A$ e sia $x_{0}$ un suo punto di accumulazione.
Dire che $\lim_{ x \to x_{0} }f(x)=l$ é **equivalente** a dire che per per ogni successione $x_{n}$ contenuta in $A-\{x_{0}\}$ che tende a $x_{0}$, la successione delle immagini $f(x_{0})$ tende a $l$.

In matematichese:

$$
\begin{gathered}
	\lim_{ x \to x_{0} } f(x)=l \iff \forall x_{n} \to x_{0},\ \ \  con \  x_{n}\neq x_{0}, \text{ risulta } f(x_{n}) \to l \\
	\text{con } x_{0},l \in \mathbb{R}
\end{gathered}
$$

##### Che significa?
Studiare il comportamenteo di $f(x)$ quando $x$ tende a $x_{0}$ é equivalente a studiare la successione delle immagini $f(x_{n})$ per **ogni possibile successione** $x_{n}$ tendente a $x_{0}$.
Se ogni possibile successione di immagine finisce proprio ad $l$ ($|x_{n}-l|<\epsilon \ \ \ \forall n>\nu$ ), allora il limite della funzione é $l$, ***e viceversa***.

#### Dimostrazione
##### Limite ==> successioni
Sappiamo che $\forall\epsilon>0, \exists \sigma>0$ tale che se $|x-x_{0}|<\sigma$, allora $|f(x)-l|<\epsilon$ per la definizione di limite.
Se prendiamo una successione $x_{n} \to x_{0}$ allora siamo sicuri che $\forall n>\nu$ allora la distanza tra $x_{n}$ e $x_{0}$ sará minore di $\sigma$. Quindi significa che effettivamente si comporta come $x$, quindi le immagini di $x_{n}$ dall'indice $\nu$ in poi, cadono nell'intorno di $l$ di raggio $\epsilon$. Quindi $f(x_{n}) \to \epsilon$.

##### Successioni ==> limite
Immaginiamo per assurdo che la condizione sulle successioni valga, quindi $f(x_{n})\to l$, ma che $\lim_{ x \to x_{0} }f(x)\neq l$.
Questo significherebbe che esiste un $\epsilon_{0}$ piccolo tale che, per qualsiasi $\sigma$ troveremo sempre un punto $x$ vicino a $x_{0}$ la quale immagine rimane lontana da $l$.
Scegliamo $\sigma$ in modo da trovarne sempre piú piccoli:

$$
	\sigma = \frac{1}{n}
$$

Ora troviamo un punto $x_{n}$ tale che $|x_{n}-x_{0}|< \frac{1}{n}$, ma con $|f(x_{n})-l|>\epsilon_{0}$.
Abbiamo trovato una successione che ci porta $x_{0}$, ma le quali immagini non vanno verso $l$, ma questo contraddice la definizione di prima. Assurdo.

