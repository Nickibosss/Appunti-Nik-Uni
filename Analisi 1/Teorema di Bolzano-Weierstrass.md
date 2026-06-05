### Enunciato
Ogni successione reale **limitata** ammette *almeno una* sottosuccessione (o successione estratta) **convergente**.

#### Dimostrazione
Sia $a_{n}$ una successione limitata.
Chiamiamo $I_{0} = [a,b]$ l'intervallo chiuso e limitato che contiene tutti i termini della successione. Precisiamo che per definizione deve avere infiniti termini dato che gli indici $n$ sono infiniti per definizione.

Dividiamo $I_{0}$ a metá creando due sottointervalli che vanno rispettivamente da $[a,c_{0}]$ e $[c_{0},b]$, con $c_{0}$ il punto medio tra $a$ e $b$.

Dato che in $I_{0}$ abbiamo infiniti termini, allora *almeno una* delle due metá deve contenere infiniti termini. Definiamo la metá che contiene infiniti termini e la chiamiamo $I_{1}=[a_{1},b_{1}]$.

Ripetiamo di nuovo la divisione e scegliamo di nuovo una metá contenente infiniti termini, definendola $I_{2}=[a_{2},b_{2}]$. 

Ripetiamo infinite volte questa procedura finché non otteniamo una sequenza di intervalli $I_{k}=[a_{k},b_{k}]$, con $I_{k+1}\subset I_{k}, \ \ \forall k\in \mathbb{N}$.

Ora costruiamo la nostra successione estratta $a_{n_{k}}$ in questo modo:
- In $I_{1}$ scelgo un termine  $a_{n_{1}}$ qualsiasi.
- In $I_{2}$ scelgo un termine $a_{n_{2}}$ tale che $n_{1}<n_{2}$, e posso farlo dato che ci sono infiniti termini in $I_{2}$.
- Faccio questo infinite volte.

Per il modo in cui abbiamo fatto la nostra sottosuccessione, siamo sicuri che ogni termine $a_{n_{k}}$ della nostra estratta sia nel proprio intervallo $I_{k}=[a_{k},b_{k}]$. Quindi posso essere sicuro che:

$$
	a_{k}\leq a_{n_{k}}\leq b_{k}
$$

Dato che la distanza degli estremi si rimpicciolisce infinitamente ($\lim_{ k \to \infty } a_{k}-b_{k} = 0$) sia $a_{k}$ che $b_{k}$ tendono ad un numero $c$.

Per il teorema dei carabinieri, dunque, anche $a_{n_{k}}$ tende a $c$. Quindi $a_{n_{k}}$ é convergente e posso costruirla da qualsiasi successione.