Nel moto parabolico abbiamo un **punto materiale** che viene scagliato con una *velocità iniziale* $v_{0}$ e un angolo $\theta$.

Immaginiamo che il nostro punto materiale inizi ad una quota $y_{0}$, e abbia una velocità $v_{0}$ e un angolo inziale $\theta$.
Scompongo il mio vettore $\bar{v}$ nei suoi elemnenti $v_{0x}\hat{i}$ e $v_{0y}\hat{j}$.
Effettivamente sapendo l'angolo, trovo i due elementi in questo modo:
$$
v_{0x} = v_{0} \cos \theta
$$
$$
v_{0y} = v_{0} \sin \theta
$$
Nella direzione $x$ **NON HO** accelerazione, questo significa che il mio $\Delta x$, oppure $v_{0}t \cos\theta$ (dalle uguaglianze che conosciamo), rimane **costante**, quindi significa che *lungo la asse $x$* mi muovo a **velocità costante**.
Invece *lungo l'asse $y$*, sento l'accelerazione gravitazionale in questo modo:
$a = -g$
Che significa? 
**Possiamo usare le nostre equazioni** per trovare $\bar{v_{y}}$ in ogni istante $t$.
Per renderlo più esplicito:
$$
y - y_{0} = -\frac{1}{2} gt^{2} + v_{0y}t
$$
SBABUM, abbiamo appena *risolto la ballistica*.
Nel punto di massima altezza, la mia componente $y$ della velocità, quindi $v_{y}$ è $0$, prima è *positivo*, dopo è *negativo*.

Per definizione, quindi devo poi risolvere un sistema di equazione (**vedi slide**).
Qui sotto provo a trascrivere:
$$
\begin{cases}
R = v_{0} \cos \theta t \\
0 = v_{0} \sin \theta t - \frac{1}{2}gt^{2}
\end{cases}
$$
Ricordando che:
$$
t = \frac{R}{v_{0}\cos\theta}
$$
Otteniamo quindi che:
$$
R\left( \tan\theta - \frac{1}{2} g \frac{R^{2}}{v_{0}^{2}\cos \theta^{2}} = 0 \right)
$$
ALLA FINE METTENDO TUTTO INSIEME:
$$
R = \frac{v_{0}^{2}}{g} \sin 2\theta
$$
Quindi, quando la gittata $R$ è massima?
Quando $\sin 2\theta$ = 1, quindi $\theta$ è uguale a $\frac{\pi}{4}$, cioè l'angolo è di **45 gradi**.

A questo punto o imparo a memoria questa equazione, oppure, essendo parabolico, posso semplicemente trovare $t$ quando $y = 0$, oppure *il doppio* del massimo della parabola.