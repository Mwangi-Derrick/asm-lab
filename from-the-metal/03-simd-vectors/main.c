#include <stdio.h>

// This tells C that the function is defined elsewhere (in our .asm file)
extern void simd_add(double* res, double* a, double* b, int n);

int main() {
    // We are processing 4 doubles (exactly one 256-bit YMM register)
    double a[4] = {1.5, 2.5, 3.5, 4.5};
    double b[4] = {10.0, 20.0, 30.0, 40.0};
    double res[4] = {0};

    printf("Starting SIMD addition...\n");

    // Call our hand-written assembly function
    simd_add(res, a, b, 4);

    // Print results to verify
    for(int i = 0; i < 4; i++) {
        printf("res[%d]: %f + %f = %f\n", i, a[i], b[i], res[i]);
    }

    return 0;
}
