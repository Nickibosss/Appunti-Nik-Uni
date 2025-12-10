/********************************************************************************************************

Valuta se un numero è maggiore, (minore o uguale) a 10 e stampa a video il risultato

********************************************************************************************************/

#include <stdio.h>

int main(){

    // acquisisco un numero intero da tastiera -- num_utente
    // se il numero è > 10 stampa a video 
    // altrimenti stampa che è minore o uguale di 10 a video


    // acquisisco il numero da tastira
    int num_utente;
    printf("Inserisci un numero intero: ");
    scanf("%d", &num_utente);

    // valuto il numero
    if(num_utente>10){         // se num_utente > 10
        printf("Il numero %d è maggiore di 10\n",num_utente);
    }
    else{                      // altrimenti
        printf("Il numero %d NON è maggiore di 10\n", num_utente);
    }

    return 0;
}