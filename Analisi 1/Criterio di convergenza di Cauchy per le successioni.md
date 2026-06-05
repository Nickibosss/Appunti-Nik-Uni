#### Preambolo
Una successione  $a_{n}$ si dice di Cauchy quando per ogni $\epsilon>0$ piccolo, esiste un indice $\nu$ tale che, presi due indici $h$ e $k$ maggiori di $\nu$, la loro differenza é minore di $\epsilon$. In matematichese:

$$
	|a_{k}-a_{h}|<\epsilon, \ \ \ \ \forall h,k > \nu, \ \ \underset{ \text{piccola} }{ \forall\epsilon>0 }
$$
Quindi all'aumentare dell indice $n$, la distanza tra i termini diminuisce.

### Enunciato
Una successione é convergente **se e solo se** é di Cauchy.

#### Dimostrazione
##### Convergente $\implies$ Cauchy
Sia $a_{n}$ una successione convergente tendente ad $a$.
Applicando la definizione, $\exists \nu \in \mathbb{N}: \ \ |a_{n}-a|<\epsilon \ \ \ \ \forall n>\nu$.

Scegliamo due indici $h$ e $k$ maggiori di $\nu$ e cerchiamo di stimare $|a_{k}-a_{h}|$.

$$
	|a_{k}-a_{h}| = \underset{ \text{aggiungo e sottraggo }a }{ |(a_{k}-a)+(a-a_{h})| }\leq\underset{ \text{disuguaglianza triangolare} }{ |a_{k}-a|+|a-a_{h}| } < \underset{ \text{maggiore di }\nu\text{ quindi la distanza é minore di }\epsilon }{ \epsilon+\epsilon }=\epsilon 
$$

Dato che un multiplo di $\epsilon$ si puó ricondurre a $\epsilon$ allora abbiamo dimostrato che la convergente é di Cauchy.

##### Cauchy $\implies$ convergente
Una successione di Cauchy é limitata secondo il lemma uno. Dato che é limitata, il [[Teorema di Bolzano-Weierstrass]] ci garantisce che ha una sottosuccessione estratta che tende ad un numero $l$. Per il secondo lemma, una successione di Cauchy che contiene una estratta $a_{n_{k}}$ convergente ad $l$, allora anche la successione $a_{n}$ converge ad $l$.