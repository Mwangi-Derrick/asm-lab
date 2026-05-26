#include <stdio.h>
#include <stdint.h>

// Declare the external assembly function
extern int64_t complex_math(int64_t a, int64_t b, int64_t c, int64_t d, int64_t e, int64_t f);

int main() {
    int64_t a = 1, b = 2, c = 3, d = 4, e = 5, f = 6;
    
    // The sum is 21. Result should be 21 * 10 = 210.
    int64_t result = complex_math(a, b, c, d, e, f);
    
    printf("Inputs: %lld, %lld, %lld, %lld, %lld, %lld\n", a, b, c, d, e, f);
    printf("Expected: ((1+2+3+4+5+6) * 10) = 210\n");
    printf("Actual Result from ASM: %lld\n", result);
    
    if (result == 210) {
        printf("SUCCESS: Calling convention handled correctly!\n");
    } else {
        printf("FAILURE: Check your stack offsets.\n");
    }
    
    return 0;
}
