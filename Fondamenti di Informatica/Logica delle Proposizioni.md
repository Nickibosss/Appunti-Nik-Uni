
#università #teoria #logica
La **verità** di un predicato che contiene **operatori logici** può essere facilmente calcolata a partire dalla *verità dei predicati componenti* e dalle *proprietà degli operatori che li collegano*.
Conoscere le proprietà della logica delle proposizioni ci permette di risolvere problemi in maniera più *semplice*.

La logica dgli operatori è un'[[Logica Booleana|algebra di Boole]].

Per lavorare con l'algebra delle proposizioni abbiamo bisogno di *operatori di confronto*, cioè che mi permettono di definire **predicati semplici**. A partire dai *predicati* posso usare gli **operatori** per arrivare alle proposizioni stesse.

Gli operatori logici mi permettono di ottenere **proposizioni composte**.

Tra gli operatori esistono **regole di precedenza**:
```
NOT --> AND --> OR
```

quindi:
`a OR NOT b AND NOT c`
è uguale a:
`a OR ((NOT b) AND (NOT c))`5
#### Esempio di condizioni composte:
$$
x \in\ [-5,3] \cup\ [8.15]
$$
```c
Viene scritto come
a = x >= -5  
b = x <= 3
c = x >= 8
d = x <= 15

A = a AND b
B = c AND d

A OR B 

QUINDI:
(a AND b) OR (c AND d)
```
###
Con i tre operatori base possiamo andare a costruire anche altri operatori.
>[!example] Algoritmo dell'impiegato dell'ufficio postale
>Un impiegato può accettare un bollettino se:
>- l'utente ha consegnato meno di 5 bollettini.
>- **o**
>- **non** ci sono altri utenti in coda
>
>La forma formalizzata può essere:
>**A** = n bollettini < 5
>**B** = ci sono utenti in coda
>Quindi: `A OR (NOT A AND NOT B) = A OR NOT B`

