#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "print_matrix.h"

void print_matrix(double matrix[], int n)
{
    for (int col = 0; col < n; col++) {
        for (int row = 0; row < n; row++) {
            printf("%6.2f", matrix[row * n + col], " ");
            printf("  ");
        }
        printf(" \n");
    }
}
