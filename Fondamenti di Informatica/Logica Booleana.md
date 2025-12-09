#programmazione #università #teoria 
In generale i nostri *elaboratori* sono macchine che **compiono operazioni**.
Alcune sono operazioni matematiche, altre sono operazioni *logiche*.

Al centro della *logica booleana* abbiamo tre operatori:
- **AND** - dati due bit restituisce `1`, *se e solo se* entrambi i bit sono `1`, **altrimenti** restituisce `0`
- **OR** - dati due bit restituisce `1` *a meno che* entrambi i bit siano `0`
- **NOT** - restituisce l'**opposto** del bit

Queste operazioni sono descritte nelle **tavole di verità**.

| a   | b   | **NOT** a | a **AND** b | a **OR** b | a **XOR** b |
| --- | --- | --------- | ----------- | ---------- | ----------- |
| `0` | `0` | `1`       | `0`         | `0`        | `0`         |
| `0` | `1` | `1`       | `0`         | `1`        | `1`         |
| `1` | `0` | `0`       | `0`         | `1`        | `1`         |
| `1` | `1` | `0`       | `1`         | `1`        | `0`         |
-- **XOR** restituisce `1` *se e solo se* **uno e uno solo** dei bit sono `1`.
 
Questa è un operazione che lavora sui singoli bit, ma gli **operatori** possono accettare come argomento anche due *serie* di bit.
- In questo caso operano sui bit che *hanno la stessa posizione*
Esempio:
```
 0 1 0 0 1 0   AND
 0 1 1 0 0 1    =
 -----------
 0 1 0 0 0 0
```

Una *stringa* può essere usata come **bitmask**. In tal caso gli operatori *bitwise* hanno diversi usi super pratici.

Nello specifico useremo la logica booleana per associare `0` o `1` a variabili di *verità* e utilizzare queste variabili come *condizioni* nei nostri algoritmi, specificamente in quello che chiamiamo **logica delle proposizioni**.
- Specificamente se abbiamo nel nostro codice una condizione più semplice rischiamo meno errori :3

-- la *logica di bool* va a modellare una **rete logica elettronica** (modella circuiti fisici).

Cosa è [l'algebra booleana](https://it.wikipedia.org/wiki/Algebra_di_Boole)?
`[scrivi appunti algebra di boole]`

Per definire un **algebra di Boole** dobbiamo far valere i 7 più 7 postulati.

>[!example] Ricordiamo!
>Teniamo a mente che nell'algebra di Boole la proprietà *distributiva* vale sia per l'addizione che la moltiplicazione.

### Teorema di De Morgan
$$
\bar{a}\bar{+}\bar{b} = \bar{a}\cdot \bar{b} _{(1)}
$$
$$
\bar{ab} = \bar{a}+\bar{b} _{(2)}
$$
Questo mi permette di usare questo teorema per avere delle *soluzioni più semplici*.
Effettivamente questi valori **mappano** perfettamente quelle chiamate *porte logiche*, che rappresentano l'architettura elettronica.

La risorsa *spazio* è fondamentale nella progettazione di un sistema, quindi avere una *soluzione* equivalente ma più semplice è **sempre** favorevole.

Andiamo a dimostrare la prima uguaglianza.
$$
\overline{a+b} = \bar{a}\cdot \bar{b}
$$
Se è vera questa informazione so (per la proprietà 7) che:
$$
\begin{cases}
a \cdot \bar{a} = 0 \\
a + \bar{a} = 1
\end{cases}\to \begin{cases}
(a+b)\cdot(\bar{a}\cdot\bar{b})=0 \\
(a+b)+(\bar{a}\cdot \bar{b}) = 1
\end{cases}
$$
Applico la proprietà distributiva:
$$
\begin{cases}
(a+b)\cdot(\bar{a}\cdot \bar{b}) = 0 \\
(a+b)+(\bar{a}\cdot \bar{b})=1
\end{cases} \to \begin{cases}
(a\cdot (\bar{a}\cdot \bar{b}) + (b \cdot (\bar{a}+\bar{b})) \\
(a+b+\bar{a})\cdot(a+b+\bar{b})
\end{cases}\underset{ \text{commutattiva e associativa} }{ \to } \begin{cases} 
((a\cdot \bar{a})*\bar{b})+((b\cdot \bar{b})\cdot\bar{a})\\
(a+\bar{a}+b) \cdot (a+b+\bar{b})
\end{cases}
$$
Applico proprietà del complemento:
$$
\begin{cases} 
(0\cdot\bar{b})+(0\cdot \bar{a})=0 \\
(1+b)\cdot (a+1) = 1 \\
\end{cases}\to \begin{cases}
0+0=0 \\
1\cdot1 = 1 \\
\end{cases}
$$Ho dimostrato l'uguaglianza.
La (2) vale per *dualità*.

L'algebra di Boole è utile anche a modellare l'*algebra degli insiemi*.

## Circuiti Logici
Nell'ambito dei circuiti elettronici è possibile andare a costruire delle *reti logiche* che sono **descritte** dall'Algebra di Boole.
In questo caso i nostri *operatori logici* sono le effettive *porte logiche*.