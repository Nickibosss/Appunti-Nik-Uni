//*************************************************************************
// Progetta e scrivi un programma che chiede all'utente un intero finchè non si trova tra 1 e 12 (compresi)
//*************************************************************************

// do - while
// finchè n<1 oppure n>12 esegui?

#include <stdio.h>

int main(){
    int scelta_utente;

    do {
    printf("Inserisci numero: ");
    scanf("%d", &scelta_utente);
    if (scelta_utente<1||scelta_utente>12) {
        printf("no... riprova... XvX\n");
    }
    }while (scelta_utente<1||scelta_utente>12);
    
    printf("Il numero è nell'intervallo segreto hihihi :3\n");

    return 0;
}