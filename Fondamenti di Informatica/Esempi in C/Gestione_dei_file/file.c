#include <stdio.h>
#define DIM 25

int main(){
    // apertura file
    char input_filename[] = "dati.txt";
    FILE * in_file=fopen(input_filename, "r");

    // lettura di valori
    int v[DIM];
    int valori_da_leggere = 4;
    int tmp;
    for (int i=0; i<valori_da_leggere && fscanf(in_file, "%d", &tmp) != EOF; i++){ // ogni volta che invoco fscanf leggo sequenzialmente i valori
        v[i] = tmp;
    }

    // chiudo file
    fclose(in_file);

    // stampa a video per controllo
    for (int i=0; i<valori_da_leggere; i++){
        printf("%d ", v[i]);
    }

    FILE * out_file = fopen("dati_out.txt", "w"); // ATTENZIONE! elimina dati da file
    for (int i=0; i<valori_da_leggere; i++){
        fprintf(out_file, "%d ", v[i]);
    }

    // chiudo file
    fclose(in_file);

    return 0;
}
