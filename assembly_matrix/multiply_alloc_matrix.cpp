#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "multiply_alloc_matrix.h"

double *multiply_alloc_matrix(double a[], double b[], int n)
{
    double* c;
    c = (double*)malloc(n * n * sizeof(double));
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            c[i * n + j] = 0;
            for (int k = 0; k < n; k++) {
                c[i * n + j] += a[i + n * k] * b[k + n * j];
            }
        }
    }

    return c;
}

