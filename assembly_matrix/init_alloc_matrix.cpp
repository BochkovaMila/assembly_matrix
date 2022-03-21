#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "init_alloc_matrix.h"

double *init_alloc_matrix(int n)
{
    double* matrix;
    matrix = (double *)malloc(n * n * sizeof(double));
    for (int i = 0; i < n*n; ++i) {
        matrix[i] = (double)rand() / (double)RAND_MAX * (20 - -12) + -12;
    }
    return matrix;
}
