/* ITP1_5_B: Print a frame */

#include <iostream>
#include <cstdio>
using namespace std;

int W = -1, H = -1;

void fill_chars(char line[], char side, char inside) {
    line[0] = side;
    for (int i = 1; i < W - 1; i++) {
        line[i] = inside;
    }
    line[W - 1] = side;
}

void print_frame() {
    char line[W + 1];
    line[W] = NULL;

    fill_chars(line, '#', '#');
    printf("%s\n", line);

    fill_chars(line, '#', '.');
    for (int i = 1; i < H - 1; i++) {
        printf("%s\n", line);
    }

    fill_chars(line, '#', '#');
    printf("%s\n", line);
}

int main() {
    while(true) {
        scanf("%d%d\n", &H, &W);
        if ( W == 0 && H == 0 ) break;
        print_frame();
        printf("\n");
    }
}
