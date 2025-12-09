#esercizi #codifica_e_rappresentazione #logica #programmazione #università

## Codifica e rappresentazione
>[!exercise] Esercizio 1  
>Quante parole codice di lunghezza 3 diverse si hanno a disposizione sfruttando un alfabeto costituito da soli 5 simboli?

$$
n = m^{l} = 5^{3} = 125 \ \text{parole codice}
$$

>[!esercizio]  Esercizio 2 
>Quanti bit occorrono per codificare una scelta tra 18 possibili valori?

$$
2^{l} \geq |v|
$$
$$
m = \lceil \log_{n}l \rceil = \lceil \log_{2}18 \rceil = 5 \ \text{bit}
$$

>[!esercizio] Esercizio 3
>Quanti bit occorrono per codificare valori di temperatura nell'intervallo $[0,32]\degree C$ con la precisione di $0.5 \degree C$.

Per avere precisione di $0.5 \degree C$, duplico il limite massimo dell'intevallo perché per ogni numero intero ne considero uno decimale.
Ottengo l'intervallo $[0,64]$. In questo intervallo ho $65$ valori. Per codificare 65 valori in decimale so che:
$$
2^{l} \geq 65
$$
$$
\lceil \log_{2} 65 \rceil \approx \lceil 6.04 \rceil  = 7 
$$
Quindi necessito di almeno $7$ bit.

## Logica delle Proposizioni
>[!esercizio] Esercizio 1
>Definire gli operatori booleani `B` e relazionali `R` correti.
>y= true se x non è minore di -12, purchè x sia diverso da -3
>
>y = x `R` -12 `B` x `R` -3
>$R \in \{ <; \leq, >, \leq ,=,\neq  \}$
>$B \in \{ AND, NOT,OR,XOR\}$

x deve essere $\geq -12$ e allo stesso tempo $\neq -3$.
Quindi la proposizione corretta sarà:
$$
y = x \geq -12 \ AND \ \neq -3
$$
>[!esercizio] Esercizio 2
>La condizione NON è verificata se la temperatura (T) è inferiore a $10 \degree C$ quando l'umidità (U) è superiore a $50\%$.
>
>y = (T `R` $10 \degree C$) `B` U `R` $50\%$) `B` U `R` $50\%$

```c
y = (T >= 10 AND U > 50) OR U <= 50 
```

## Intervalli rappresentabili
>[!esercizio] Esercizio 1
>Qual è l'intervallo rappresentabile con 3 bit con codifica complemento a 2?

$$
[-2^{l-1}, 2^{l-1} -1] = [-4,3]
$$

>[!esercizio] Esercizio 2
>Qual è  l'intervallo rappresentabile con 3 bit con codifica segno e modulo?

`3` bit mi danno `8` valori. Ricordiamo che abbiamo la doppia rappresentazione dello `0`, quindi i valori rappresentabili devono essere `7`. L'intervallo quindi è $[-3,3]$

## Rappresentazione dei numeri positivi

>[!esercizio] Esercizio 1
>Come si rappresenta il numero `+12` in segno e modulo su `8` bit?

```c
0             | 0 0 0 0 0 0 0
------------------------------
pos quindi 0  | 0 0 0 1 1 0 0
              | 0+0+0+8+4+0+0
```

>[!esercizio] Esercizio 2
>Come si rappresenta il numero $12$ in complemento a $2$ su $8$ bit?

Il numero è positivo, la rappresentazione è uguale :)

## Rappresentazione dei numeri negativi
>[!esercizio] Esercizio 1
>Come si rappresenta il numero `-12` in segno e modulo su `8` bit?

```c
1             | 0 0 0 0 0 0 0
------------------------------
neg quindi 1  | 0 0 0 1 1 0 0
          (-) | 0+0+0+8+4+0+0
```

>[!esercizio] Esercizio 2
>Come si rappresenta il numero $12$ in complemento a $2$ su $8$ bit?

Complemento la rappresentazione binaria pesata del `12` e aggiungo `1`
```c
0 0 0 0 1 1 0 0 |
----------------|-----------
1 1 1 1 0 0 1 1 | + 1
1 1 1 1 0 1 0 0 |
```

## Rappresentazione in virgola mobile
>[!esercizio] Esercizio 1
>Rappresenta il numero $-12.0$ in accordo allo standard IEEE 754 in singola precisione?

Primo bit è il segno,  `8` bit esponente, `23` bit mantissa
```C

Segno positivo quindi primo bit è 1
Base è 2
Esponente in eccesso 127
Ricordiamo mantissa in forma normalizzata, il primo 1 è omesso.

Parto dalla rappresentazione in notazione scientifica di -12

-1100 * 2^0  // non è normalizzata quindi:

-1,100 * 2^3 // normalizzato

Rappresentiamo l'esponente in eccesso 127, quindi equivalente a 127 + 3 = 130
Quindi: 

1 0 0 0 0 0 1 0 

la mantissa omette il primo 1, quindi è 1 0 0 ... 0 0 0

costruiamo il nostro numero:

1 1 0 0 0 0 0 1 0 1 0 0 ... 0 0 0 

   1100 0001 0100 0000 0000 0000 0000 0000
0x C    1    4    0    0    0    0    0
0x C1 40 00 00
```