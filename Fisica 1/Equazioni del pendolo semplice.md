---
id: Equazioni del pendolo semplice
aliases: []
tags: []
---

Ricordando che effettivamente segue una traiettoria **circolare**, quindi la velocità istantanea è *tangenziale* alla curva.

Prima assunzione che dobbiamo fare è che gli angoli siano **necessariamente piccoli**.
Chiamiamo l'angolo che percorre il pendolo $\theta$, e lo spostamento $s$.
Quindi, nella nostra ipotesi:
$$
s = L \theta
$$

Il nostro pendolo è soggetto ad una forza $F$, che è la proiezione della forza peso lungo la traiettoria, quindi $m \vec{g}$.

Quindi abbiamo il modulo della forza tangente:
$$
F_{t} = mg \sin \theta = m a_{t}(t)
$$
$a_{t}$ è l'accelerazione tangenziale in tempo $(t)$. Ora spostando un paio di termini che abbiamo trovato:
$$
a_{t}(t) = g \sin \theta = g \theta = g \frac{s}{L}
$$

Ricordando la definizione di accelerazione lungo la tangente (in [[Moto circolare uniforme]]):
$$
\frac{d^{2}s}{dt^{2}} = -\frac{g}{L}s(t)
$$
Che è **la stessa equazione** della [[Molla]]:
$$
\frac{d^{2}x}{dt^{2}} = - \frac{k}{m}x(t)
$$

