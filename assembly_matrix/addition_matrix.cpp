#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "addition_matrix.h"

void addition_matrix(double a[], double b[], double c[], int n) {
    for (int i = 0; i < n*n; i++)
    {
        c[i] = a[i] + b[i];
    }
}
