Se ho un vettore $\bar{r_{1}}$ che individua la posizione di un corpo a tempo $t_{1}$ e $\bar{r_{2}}$ è il vettore a tempo $t_{2}$ per trovare lo spostamento tra i due vettori posso tranquillamente trovare lo **spostamento** $\Delta \bar{r}$ facemdo la *differenza* tra i due vettori in due modi:
- Metodo del parallelogramma tra i due **vettori** $\bar{r_{1}}, \bar{r_{2}}$.
- La differenza dei **componenti** dei vettori in questo modo:
$$
\Delta \bar{r} = \Delta x \hat{i} + \Delta y \hat{j} + \Delta z \hat{k}
$$
Quindi matematicamente la velocità posso calcolarla in questo modo:
$$
\bar{v}_{avg} = \frac{\Delta \bar{r}}{\Delta t} = \frac{\Delta x \hat{i} + \Delta y \hat{j}}{\Delta t}
$$
Quindi trovo la velocità, applicando quello trovato in [[Lezione 3]], possiamo dire che la velocità è:
$$
\bar{v}= v_{x} \hat{i} + v_{y} \hat{j} \implies \bar{v} = \frac{dx}{dt} + \frac{dy}{dt}
$$
A che ci serve?
Per trovare il vettore **velocità** in una traiettoria **curvilinea**.
P.S. una traiettoria *curvilinea* può essere approssimata in una  traiettoria **circolare** in ogni punto.

### Direzione dei vettori
Una volta trovato il vettore velocità, possiamo definire il vettore accelerazione:
La prima cosa che ci dobbiamo chiedere è **quale sia la direzione**.
Sappiamo che $\bar{v}$ è parallelo a $\Delta \bar{r}$, e allo stesso modo **$\bar{a}$ è parallelo a $\Delta \bar{v}$**.

Il problema di una traiettoria curva è che i vettori velocità **variano su tutta la traiettoria**.
[vedi pdf]
Mentre la velocità istantanea è **sempre parallela** alla curva, nel caso dell'accelerazione, (ricordando la definizione di $\Delta \bar{v}$), punta *necessariamente* all'interno della curva!
Specificamente abbiamo una componente **tangenziale** ed una componente **centripeda**.

Esistono casi specifici come il [[Moto circolare uniforme]].
Ovviamente, definiamo $\bar{a}$ come $\frac{\Delta \bar{v}}{\Delta t}$
Ricordiamo comunque che la variazione la misuriamo come la **derivata** della funzione della quantità in un punto specifico,
quindi in questo caso:
$$
\bar{a} = \frac{d \bar{v}}{d t}
$$
