// X[ix], Y[iy]文字目の時点のLCSを求めるために、直前までの結果を利用する事を考える。
// X[ix] == Y[iy]であれば、X[ix - 1], Y[iy - 1]の時点のLCS + X[ix](or Y[iy])
// がLCSになるはず。
// X[ix] != Y[iy]であれば、X[ix - 1], Y[iy] までのLCSか、
// X[ix], Y[iy - 1] までのLCSのどちらか大きい方になるはず。
//
// X, Y の文字を行・列とする表を作り、各マスにそこまでのX, Yの文字で作れる
// LCSの長さを入れていく作業をイメージするとわかりやすい。


/* ALDS1_10_C: Longest Common Subsequence */

#include <iostream>
#include <cstdio>

const int MAX_LENGTH = 1000 + 1;

int max_lcs(char X[], char Y[]) {
    int lcs[MAX_LENGTH + 1][MAX_LENGTH + 1];
    int i, xsize, ysize;

    for(i = 0; X[i]; i++)
        lcs[i][0] = 0;
    xsize = i;

    for(i = 0; Y[i]; i++)
        lcs[0][i] = 0;
    ysize = i;

    for (int ix = 1; ix <= xsize; ix++) {
        for (int iy = 1; iy <= ysize; iy++) {
            if (X[ix - 1] == Y[iy - 1]) {
                lcs[ix][iy] = lcs[ix - 1][iy - 1] + 1;
            }
            else {
                int above = lcs[ix - 1][iy];
                int left  = lcs[ix][iy - 1];
                lcs[ix][iy] = above < left ? left : above;
            }
        }
    }
    return lcs[xsize][ysize];
}

int main() {
    int n_pairs;
    scanf("%d", &n_pairs);

    char X[MAX_LENGTH], Y[MAX_LENGTH];
    for (int i = 0; i < n_pairs; i++) {
        scanf("%s\n%s", X, Y);
        printf("%d\n", max_lcs(X, Y));
    }

    return 0;
}





