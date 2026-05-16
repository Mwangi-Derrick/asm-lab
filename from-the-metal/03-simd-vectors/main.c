#include <stdio.h>

extern void simd_add(double* res, double* a, double* b, int n);

int main() {
    double a[4] = {1.0, 2.0, 3.0, 4.0};
    double b[4] = {10.0, 20.0, 30.0, 40.0};
    double res[4];

    simd_add(res, a, b, 4);

    return 0;
}
