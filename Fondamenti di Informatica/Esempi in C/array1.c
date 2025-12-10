/*
Lavoriamo con un vettori ad interi, lo inizializziamo e ricerchiamo un elemento.
*/

/*
procedura ricerca
cerca in V[] valore_da_cercare fino a i<riempimento opppure trovato = true
se lo trova restituisce trovato = true e l'indice in cui si trova
altrimenti restituisce trovato = false e indice -1
*/

#include <stdio.h>
#include <stdbool.h>

// al posto di scrivere un numero nella definizione uso una macro
#define MAXDIM 50

// funzione di ricerca
    // metto const prima dei parametri in solo ingresso per chiedere al compilatore di verificare che non cerco di modificare i valori solo in ingresso
void ricerca (const int v[],const int riempimento, bool *trovato, int *indice, const int valore_da_cercare){ 
    for (int i=0; i<riempimento; i++) {
        if (v[i] == valore_da_cercare) {
            *trovato = true;
            *indice = i;
            return;
        }  
    }
    // fuori dal ciclo for sono sicuro che non ho trovato il valore nel mio array 
    *trovato = false;
    *indice = -1;
    return;
}

// funzione di ricerca modificata
void ricerca_num_occorenze (const int v[],const int riempimento, int *numero_occorrenze, const int valore_da_cercare){
    *numero_occorrenze = 0;
    for (int i=0; i<riempimento; i++) {
        if (v[i] == valore_da_cercare) {
            (*numero_occorrenze)++;
        }
    }
}

int main (){
    // inizializzo e dichiaro il vettore
    int voti_esame[MAXDIM] = {27,30,31,25,18};
    // inizializzo la variabile di riempimento
    int num_esami = 5; //la inizializzo al prossimo indice utile
    
    bool trovato_voto;
    int indice_voto;
    int voto_da_cercare = 18;
    int n_voti_trovati;

    ricerca(voti_esame, num_esami, &trovato_voto, &indice_voto, voto_da_cercare);

    if (trovato_voto) {
        printf("ho trovato il voto %d ", voto_da_cercare);
        printf("all'indice %d", indice_voto);
    } else {
        printf("non ho trovato il voto %d", voto_da_cercare);
    }
    
    ricerca_num_occorenze(voti_esame, num_esami, &n_voti_trovati, voto_da_cercare);

    printf("ho trovato il voto %d %d volte", voto_da_cercare, n_voti_trovati);

    return 0;
}