#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "diagonal_matrix.h"

double *diagonal_matrix(int n, int m, double a[], int N)
 {
     double* result = (double*)malloc(N * sizeof(double));
     int j = n;
     int i = m;
     int count = 0;
     while (count < N)
     {
        j = j % N;
        i = i % N;
        result[count] = a[j * N + i];
        i++;
        j++;
        count++;
     }
     return result;
}
