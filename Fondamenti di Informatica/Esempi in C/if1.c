/*********************************************************************************

Valuta se un numero intero è maggiore di 10, in questo caso lo stampa a video.

*********************************************************************************/

#include <stdio.h>

int main(){
    
    //acquisisci numero *intero* da tastiera -- num_utente
    //se num_utente > 10 stampa messaggio

    int num_utente;
    printf("Inserisci numero: ");
    scanf("%d", &num_utente);

    if (num_utente > 10){
        printf("Il numero è maggiore di 10\n");
    }
}