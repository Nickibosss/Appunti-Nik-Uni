#include <stdio.h>
#include <stdlib.h>

struct elemento{
    int valore;
    struct elemento* prossimo;
};

typedef struct elemento* lista;

// dichiarazione funzioni
void aggiungi_in_coda(lista *l, int valore);
lista nuovalista();
void visualizza_lista(lista *l);
void elimina_elemento(lista *l, int posizione);
void dealloca_lista(lista *l);

int main(){

    return 0;
}

lista nuovalista(){ // molto comodo da usare per creare la listina
    return NULL;
}

// trovo l'ultimo elemento, alloco spazio per nuovo nodo, assegno al valore il valore, assegno al puntatore NULL
// input: puntatore a nodo, valore del nodo
// output: nessuno (crea nodo)
void aggiungi_in_coda(lista *l, int valore){
    if(*l==NULL){ // se lista di un solo elemento
        *l = malloc(sizeof(struct elemento));
        (*l)->valore = valore;
        (*l)->prossimo = NULL;
    } else {
        lista p=*l;
        while (p->prossimo!=NULL) { // se non è l'ultimo elemento procedo al prossimo nodo
            p=p->prossimo;
        }
        // quanso sono fuori dal while sono sicuro che ho raggiunto l'ultimo elemento
        p = malloc(sizeof(struct elemento));
        p->valore = valore;
        p->prossimo = NULL;
    }
    return;
}

// scorro lista, per ogni nodo stampo a video
// input: puntatore a nodo
void visualizza_lista(lista *l){
    lista p=*l;
    while (p!=NULL) { // finchè trovo l'ultimo elemento
        printf("%d\n", p->valore);
        p=p->prossimo;
        }
    return;
}

// trova elemento, collega elemento precedente al prossimo, libera memoria
// input: puntatore a nodo, valore da eliminare
// output: modifica lista
void elimina_elemento(lista *l, int valore){
    lista p=*l;
    lista p_prev=p; // puntatore all'elemento precedente
    while (p->valore != valore&&p->prossimo!=NULL) {
        p_prev = p;
        p = p->prossimo;
    }
    if (p->valore == valore) {
        p_prev->prossimo = p->prossimo;
        free(p);
    }
    return;
}

void dealloca_lista(lista *l){
    lista p = *l;
    while (p!=NULL){
        lista q = p; // mi serve una copia per deallocare, altrimenti perdo p
        p=p->prossimo;
        free(q);
    }
    l = NULL; // elimino la lista
    return;
}
