//*************************************************************************
// Progetta un programma che dato un numero intero n da utente stampa a video la tabellina da n*1 a n*10
//*************************************************************************

// ciclo while
// i

#include <stdio.h>

int main(){

    int n_tabellina, risultato;

    //acquisisco n
    printf("Inserisci numero *intero* per la tabellina: ");
    scanf("%d", &n_tabellina);

    // stampa tabellina di n
    int i = 1;
    printf("Ecco la tabellina di %d:\n",n_tabellina);
    while (i<=10) {
        risultato = n_tabellina*i;
        printf("%d * %d = %d\n",n_tabellina, i, risultato);
        i++;
    }

    return 0;
}