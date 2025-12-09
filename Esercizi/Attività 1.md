#università #programmazione #esercizi 
### Errore 1
1. **Codice sorgente nella forma che causa l'errore**:
```c
1. // Il primo programma in C
2. #include <stdio.h>
3.
3. int main
4. {
5. printf("Hello, world!\n");
6. return 0;
7. }
```
2. **Messaggio di errore**:
```c
Compito1.c:5:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
    5 | {
      | ^
```
3. **Fase di traduzione o uso**: compilatore.
4. **Spiegazione letterale**: Il compilatore si aspetta '`=`', '`,`', '`;`', '`asm`' oppure '`__attribute__`' prima della parentesi graffa nella riga 5.
5. **Difetto**: Dopo main mancano le parentesi tonde aperte e chiuse che indicano che main è una funzione. Il compilatore quindi non ha idea di cosa sia e da errore.
6. **Versione corretta**:
```c
3. int main()
```  

### Errore 2
1. **Codice sorgente nella forma che causa l'errore**:
```c
1. // Il primo programma in C
2. #include <stdio.h>
3. 
4. int main()
5. {
6.     prntf("Hello, world!\n");
7.     return 0;
8. }
```
2. **Messaggio di errore**:
```c
Compito1.c: In function ‘main’:
Compito1.c:6:5: error: implicit declaration of function ‘prntf’; did you mean ‘printf’? [-Wimplicit-function-declaration]
    6 |     prntf("Hello, world!\n");
      |     ^~~~~
      |     printf
```
3. **Fase di traduzione o uso**: Compilatore
4. **Spiegazione letterale**: La funzione `prntf` è stata dichiarata implicitamente, forse ho sbagliato a scrivere `printf`.
5. **Difetto**: La funzione `prntf` non è dichiarata nel codice né presente nel file header <stdio.h>, questo perché è presente un errore tipografico. La funzione che intendevo inserire, come suggerito dal messaggio di errore, è  `printf`
6. **Versione corretta**:
```c
6.     printf("Hello, world!\n");
```

### Errore 3
1. **Codice sorgente nella forma che causa l'errore**:
```c
1. // Il primo programma in C
2. #include <stdio.h>
3. 
4. int main()
5. {
6.     printf("Hello, world!\n")
7.     return 0;
8. }
```
2. **Messaggio di errore**:
```c
Compito1.c: In function ‘main’:
Compito1.c:6:30: error: expected ‘;’ before ‘return’
    6 |     printf("Hello, world!\n")
      |                              ^
      |                              ;
    7 |     return 0;
      |     ~~~~~~    
```
3. **Fase di traduzione o uso**: Compilatore
4. **Spiegazione letterale**: Alla linea 6, prima di return (cioè la prima parola della linea 7), è necessario ci sia un `;`.
5. **Difetto**: Il difetto corrisponde al messaggio di errore
6. **Versione corretta**:
```c
6. printf("Hello world!\n");
```

### Errore 4
1. **Codice sorgente nella forma che causa l'errore**:
```c
1. // Il primo programma in C
2. #include <stdio.h>
3.  
4. int main()
5. {
6.     printf("Hello, world!\n")
7.     return 0;
8.
```
2. **Messaggio di errore**:
```c
Compito1.c: In function ‘main’:                 
Compito1.c:7:5: error: expected declaration or statement at end of input
    7 |     return 0;
      |     ^~~~~~
```
3. **Fase di traduzione o uso**: Compilatore.
4. **Spiegazione letterale**: Il compilatore aspetta una dichiarazione o statement alla fine dell'input.
5. **Difetto**: L'argomento della funzione `main` deve essere chiuso tra due parentesi graffe (`{}`). In questo caso la parentesi graffa che chiude manca.
6. **Versione corretta**:
```c
8. }
```

### Errore 5
1. **Codice sorgente nella forma che causa l'errore**:
```c
1. // Il primo programma in C
2. #include <stdio.h>
3. 
4. int main()
5. {
6.     printf(Hello, world);
7.     return 0;
8. }
```
2. **Messaggio di errore**:
```c
Compito1.c: In function ‘main’:
Compito1.c:6:12: error: ‘Hello’ undeclared (first use in this function); did you mean ‘ftello’?
    6 |     printf(Hello, world);
      |            ^~~~~
      |            ftello
Compito1.c:6:12: note: each undeclared identifier is reported only once for each function it appears in
Compito1.c:6:19: error: ‘world’ undeclared (first use in this function)
    6 |     printf(Hello, world);
      |                   ^~~~~
```
3. **Fase di traduzione o uso**: Compilatore
4. **Spiegazione letterale**: `Hello` e `world` non sono state dichiarate e il loro primo uso è alla riga 6 nella funzione main. Nel caso di `Hello` potrebbe essere un errore di battitura (il messaggio di errore suggerisce che la parola intesa potrebbe essere `ftello`) 
5. **Difetto**: Non ho racchiuso la stringa `Hello, world!`  tra le doppie virgolette `""`, quindi il compilatore interpreta sia `Hello` che `world` come variabili o funzioni.
6. **Versione corretta**:
```c
6.     printf("Hello, world");
```
Piccola parentesi, abbiamo detto che è meglio includere `\n` alla fine di una stringa in `printf` per andare a un rigo nuovo e rendere l'output nel terminal più leggibile, quindi anche se il codice sopra non darà errore, una versione più corretta sarebbe:
```c
6.     printf("Hello, world\n");
```

*(vorrei sottolineare che questo non è un output di un' AI, sono solo molto organizzato nel formatting e uso markdown quando scrivo testo)*