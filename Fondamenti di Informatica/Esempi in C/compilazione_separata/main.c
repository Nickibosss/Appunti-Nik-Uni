#include <stdio.h>
#include "mylib.h"

int main(){
    int n = 1;
    for (int i=0; i<10; i++){
        incr(&n, 12);
        printf("%d", n);
    }
}
