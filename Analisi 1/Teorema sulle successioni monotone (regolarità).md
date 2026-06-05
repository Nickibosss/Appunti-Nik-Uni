### Enunciato
Ogni successione monotona é regolare. 

Che signifca che ammette limite.

#### Dimostrazione
Poniamo $l$ come $\text{sup } a_{n}$ e supponiamo $a_{n}$ limitata e crescente.
Per l'assioma di completezza $l$ esiste ed é finito.

Se $l$ é  il $\text{sup}$ di $a_{n}$ allora significa che per qualsiasi valore di $n$ risulterá $a_{n}\leq l$.
Fissiamo un $\epsilon>0$. Per questa equivalenza significa che **deve esistere** un indice $\nu \in \mathbb{N}$ tale che $a_{\nu}>l-\epsilon$. 
Quindi per $n>\nu$ risulta che $l-\epsilon>a_{\nu}\geq a_{n}$. 
$a_{n}$ non puó mai superare $l$ dato che é il suo $\text{sup}$, quindi possiamo dire con certezza che:

$$
	\forall n>\nu, \ \ \ l-\epsilon<a_{n}\leq l<l+\epsilon
$$

Dato che $\forall n>\nu,$  $|a_{n}-l|<\epsilon$, allora significa che $\lim_{ n \to \infty }a_{n} = l$.