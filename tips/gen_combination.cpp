/*
 * 要素数のわかっている配列から作れる全ての組み合わせを表示する
 * プログラム
 */

#include <iostream>
#include <vector>
using namespace std;

const int L = 5;
int array[L] = { 0, 1, 2, 3, 4 };

// 指定された配列の要素の全ての組み合わせを再帰的に
// 出力する関数
void rec_combi(int array[], vector<int>& v, int start) {
    for (int i = start; i < L; i++) {
        v.push_back(i);
        for (int j = 0; j < v.size(); j++) {
            cout << " " << array[ v[j] ];
        }
        cout << endl;
        rec_combi(array, v, i + 1);
        v.pop_back();
    }
}
// XXX:
// 指定された数の全ての組み合わせを出力する関数を作れれば、
// その関数を使って0から配列の長さまでの全組み合わせを順に
// 出力するだけで済む。その方が分割としてもきれい。

int main() {
    vector<int> v;
    rec_combi(array, v, 0);
}

// 0
// 0 1
// 0 1 2
// 0 1 2 3
// 0 1 2 3 4
// 0 1 2 4
// 0 1 3
// 0 1 3 4
// 0 1 4
// 0 2
// 0 2 3
// 0 2 3 4
// 0 2 4
// 0 3
// 0 3 4
// 0 4
// 1 2
// ...
