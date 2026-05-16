#include <stdio.h>

// Implementing the logic in C to see how GCC vectorizes it
void simd_add_c(double* res, double* a, double* b, int n) {
    for (int i = 0; i < n; i++) {
        res[i] = a[i] + b[i];
    }
}

int main() {
    double a[4] = {1.5, 2.5, 3.5, 4.5};
    double b[4] = {10.0, 20.0, 30.0, 40.0};
    double res[4] = {0};

    printf("Starting C-based SIMD addition (auto-vectorized)...\n");

    simd_add_c(res, a, b, 4);

    for(int i = 0; i < 4; i++) {
        printf("res[%d]: %f + %f = %f\n", i, a[i], b[i], res[i]);
    }

    return 0;
}
