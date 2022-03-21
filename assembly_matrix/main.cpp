#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include"addition_matrix.h"
#include"diagonal_matrix.h"
#include"init_alloc_matrix.h"
#include"multiply_alloc_matrix.h"
#include"print_matrix.h"

int main() {
    double *a = init_alloc_matrix(3);

    double *b = init_alloc_matrix(3);

    printf("matrix a:\n");
    print_matrix(a, 3);

    printf("matrix b:\n");
    print_matrix(b, 3);

    printf("result of broken diagonal for a23:\n");
    double* res = diagonal_matrix(2, 1, a, 3);
    for (int i = 0; i < 3; i++) {
        printf("%f ", res[i], " ");
    }

    double* c = multiply_alloc_matrix(a, b, 3);
    printf("\nmatrix c=a*b:\n");
    print_matrix(c, 3);

    double* d = init_alloc_matrix(3);
    addition_matrix(a, b, d, 3);
    printf("matrix d=a+b:\n");
    print_matrix(d, 3);
    free(a);
    free(b);
    free(c);
    free(d);
    free(res);
    return 0;
}
