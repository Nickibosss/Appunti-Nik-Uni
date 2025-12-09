#programmazione #teoria #università #roba_complicata 
In [[C]] le stringhe sono un array di caratteri. Una loro peculiarità è che la loro terminazione è segnalata dal *carattere tappo* `\0` che è un byte composto da tutti `0`. 
In C le implementiamo con questa sintassi:
```C
char stringa [grandezza stringa] = {c, i, a, o , \0}
// oppure
char stringa [grandezza stringa] = "ciao";
// oppure 
char stringa [] = "ciao";
// in questo caso la grandezza dell'array viene determinata automaticamente.
```

>[!info] N.B.
>Se dichiariamo una stringa di 14 elementi, possiamo usarne solo 13 perchè l'ultima posizione deve essere **necessariamente** il *carattere tappo*.
>
>Inoltre l'area di memoria dopo il (primo) carattere tappo potrebbe contenere qualsiasi configurazione di bit, ma non ci interessa perchè le funzioni di `string.h` lo tengono in considerazione.

Essendo che le stringhe sono degli array, le operazioni che facciamo su di loro sono più complesse. Per questo le funzioni che usiamo più spesso sulle stringhe sono implementate dalla libreria `string.h`.
Inoltre anche `printf` tiene in mente il carattere tappo ,  quindi stampa la stringa fino a dove è definita.

>[!tip] WOOHOO
>Nella prova di programmazione il professore ci mette a disposizione una tavola in cui abbiamo tutte le funzioni di `string.h`.

### Funzioni principali di string.h
##### `strcpy` (string copy)
Serve per copiare il contenuto di una stringa in un altra stringa. 

La sua sintassi è
```C
strcpy(*stringa di destinazione*, *stringa sorgente*);
```

Graficamente possiamo immaginare che succede questo:
```C
mystring
0  1  2  3  4  5  6  7  8  9 10 11 12 13
H  E  L  L  O     C  ! \0  x  F  q  :  7

anotherstring
0  1  2  3  4  5  6  7  8 
1  3  x  F  D  s  !  o  6

[DOPO strcpy(anotherstring, mystring);]

mystring
0  1  2  3  4  5  6  7  8  9 10 11 12 13
H  E  L  L  O     C  ! \0  x  F  q  :  7

anotherstring
0  1  2  3  4  5  6  7  8 
H  E  L  L  O     C  ! \0 
```

##### `strcat` (string concatenation)
Aggiunge una stringa alla fine di una seconda.

La sua sintassi è:
```C
strcat(*destinaizone*, *fonte*);
```

Graficamente possiamo immaginare che succede questo:
```C
mystring
0  1  2  3  4  5  6  7  8  9 10 11 12 13
H  E  L  L  O     C  ! \0  x  F  q  :  7

anotherstring
0  1  2  3  4  5  6  7  8 
1  2  3 \0  s  !  o  6  )

[DOPO strcat(mystring, anotherstring);]

mystring
0  1  2  3  4  5  6  7  8  9 10 11 12 13
H  E  L  L  O     C  !  1  2  3 \0  :  7

anotherstring
0  1  2  3  4  5  6  7  8 
1  2  3 \0  s  !  o  6  ) 
```

(In questo caso concateniamo `anotherstring` a `mystring`)

##### `strcmp` (string compare)
Compara due stringhe, e ritorna se sono uguali.

La sua sintassi è:
```C
strcmp(*stringa 1*, *stringa 2*);
```

