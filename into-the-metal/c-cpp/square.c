#include <stdio.h>

void square_array(double* out, const double* in, int n) {
    for (int i = 0; i < n; i++) {
        out[i] = in[i] * in[i];
    }
}

int main() {
    double in[] = {1.0, 2.0, 3.0, 4.0};
    double out[4];
    square_array(out, in, 4);
    for (int i = 0; i < 4; i++) {
        printf("%f ", out[i]);
    }
    printf("\n");
    return 0;
}
