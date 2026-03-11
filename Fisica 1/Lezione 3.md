---
id: Lezione 3
aliases: []
tags: []
---

vediti [[Punto materiale]]
vediti [[Legge oraria]]
vediti [[Cinematica]]

ok allora parliamo di cazzi e di mazzi

In cinematica, date le relazioni tra $v$, $a$, e $x$ possiamo passare da velocità ad accelerazione *derivando $v$*, mentre da $a$ a $v$ *integrando* $a$, ovviamente negli opportuni limiti di integrazione.

In matematichese posso scrivere che:
$$
a = \frac{dv}{dt} \implies \int a dt = v + c
$$
Allo stesso modo possiamo dire, tramite le equazioni del moto ad accelerazione costante:
$$
v+v_{0} = \int adt + c= at
$$
e
$$
v(t) = at+v_{0}
$$
In questo modo possiamo quindi trascrivere la [[Legge oraria]]:
$$
v (t) = \frac{dx}{dt} \implies x(t) = \int vdt + c = \int vdt + x_{0} = \int (at + v_{0} )dt + x_{0}
$$
Riscrivendolo per chiarezza:
$$
x(t) = \int (at+ v_{0}) dt + x_{0}
$$
In questo caso sia $v_{0}$ che $x_{0}$ sono due **costanti**.

Possiamo dividere l'integrale in due integrali diversi e ottenere questo:
$$
x(t) = \int at dt + \int v_{0} dt + x_{0} = \frac{1}{2} at^{2} + v_{0}t + x_{0}
$$
E quindi:

$$
x - x_{0} = \frac{1}{2} a t^{2} + v_{0}t
$$

Ritornando a pensare alla funzioni, possiamo sapere che, *in accelerazione costante* la funzione dello spostamento è una funzione di tipo **parabolico**, e il segno dell'accelerazione, (essendo la sua derivata seconda), ci da la sua **concavità**.
