Questo assioma ci permette di distinguere $\mathbb{R}$ da $\mathbb{Q}$. Infatti $\mathbb{Q}$ soddisfa i primi dieci assiomi, ma non quest'ultimo. Sotto enunciato e un esempio celebre.

## Enunciato:
Siano $A$ e $B$ due sottoinsiemi non vuoti di $\mathbb{R}$ tali che ogni elemento di $A$ sia $\leq$ ad ogni elemento di $B$, ovvero $A$ e $B$ sono **separati**:

$$
	a\leq b, \ \ \forall a \in A, \forall b \in B
$$

Allora esiste un numero reale $c\in \mathbb{R}$ tale che:

$$
	a\leq c\leq b, \ \ \forall a\in A, \forall b \in B
$$

Questo numero $c$  é detto **elemento di separazione**. Se questo elemento é *unico* allora i due insiemi sono *contigui*.

Questo assioma non é rispettato in $\mathbb{Q}$, e l'esempio piú celebre é quello di $\sqrt{ 2 }$:
- Prendiamo $A = \{a \in \mathbb{Q}:a\leq0\} \cup \{a \in \mathbb{Q}:a>0,a^{2}<2\}$ e $B = \{b \in \mathbb{Q}:b^{2}>2\}$.
- Dimostriamo per assurdo che questi due insiemi sono separati dato che se esistesse un $a>b$ allora $a^{2}$ sarebbe maggiore di $2$, quindi non apparterrebbe ad $A$.
- Quindi se valesse la completezza dovrebbe esistere un numero razionale $c$ che divida i due sottinsiemi, cioé per assurdo $a\leq c\leq b \ \ \forall a \in A , \forall b \in B$.
- Ma questo significherebbe che $c^{2}=2$, cosa non ammissibile in $\mathbb{Q}$. (vedi [[Proposizione sulla non esistenza di un razionale c tale che c^2 =2]]).

