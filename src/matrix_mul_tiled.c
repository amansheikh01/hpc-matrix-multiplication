#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

#define N 2048
#define BS 64

int main() {
    int i, j, k, ii, jj, kk;
    double *A, *B, *C;

    A = (double*)malloc(N * N * sizeof(double));
    B = (double*)malloc(N * N * sizeof(double));
    C = (double*)malloc(N * N * sizeof(double));

    #pragma omp parallel for
    for (i = 0; i < N * N; i++) {
        A[i] = 1.0;
        B[i] = 1.0;
        C[i] = 0.0;
    }

    double start = omp_get_wtime();

    // Cache-optimized tiled multiplication
    #pragma omp parallel for collapse(2) private(i,j,k,ii,jj,kk)
    for (ii = 0; ii < N; ii += BS) {
        for (jj = 0; jj < N; jj += BS) {
            for (kk = 0; kk < N; kk += BS) {
                for (i = ii; i < ii + BS && i < N; i++) {
                    for (j = jj; j < jj + BS && j < N; j++) {
                        double sum = C[i*N + j];
                        for (k = kk; k < kk + BS && k < N; k++) {
                            sum += A[i*N + k] * B[k*N + j];
                        }
                        C[i*N + j] = sum;
                    }
                }
            }
        }
    }

    double end = omp_get_wtime();

    printf("Tiled OpenMP Matrix Multiplication\n");
    printf("Matrix size: %d x %d\n", N, N);
    printf("Block size: %d\n", BS);
    printf("Threads: %d\n", omp_get_max_threads());
    printf("Execution time: %f seconds\n", end - start);

    free(A);
    free(B);
    free(C);
    return 0;
}

