/*
 * 再帰を使って長さLのビット列の全パターンを出力するプログラム例
 */

#include <iostream>
using namespace std;

const int L = 5;
int bits[L];

void rec(int i) {
    /* cout << "i = " << i << endl; */
    if (i == L) {
        for (int i = 0; i < L; i++)
            cout << " " << bits[i];
        cout << endl;
        return;
    }
    rec(i + 1);
    bits[i] = 1;
    rec(i + 1);
    bits[i] = 0;
}

int main() {
    rec(0);
}
