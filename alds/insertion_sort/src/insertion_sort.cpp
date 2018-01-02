// 挿入ソート
// トランプで言えば、バラバラの山札から
// 1枚ずつ取り出して整列した山札を作っていくイメージ。
//
// 配列をループし、先頭要素から順に「ソート済みの部分列」へと並び替えていく。
// 具体的には、「未ソートの部分列」の先頭要素をソート済み要素の末尾から順に
// 比べていき、適切な位置が見つかれば挿入する。こうして最終的には配列全体が
// 「ソート済み」になる。
//
// 挿入ソートは、既にある程度ソート済みの配列に対しては、未ソート部分の移動を
// しなくて済むためほぼ O(N) の計算量で高速に処理できる。
// その点例えばバブルソートではひとつずつ隣接する値を調べる必要があるし、
// 選択ソートでは未ソート部分列から毎回最小値を探す必要があり、
// それらの作業量は対象の配列がもともとある程度整列されていたとしても
// 変化しない。

#include <iostream>
using namespace std;

void print_elements(int length, int elements[]) {
    cout << elements[0];
    for (int i = 1; i < length; i++) {
        cout << " " << elements[i];
    }
    cout << endl;
}

void insertion_sort(int length, int elements[]) {
    int elem, i_before;
    for (int i = 1; i < length; i++) {
        elem = elements[i];
        i_before = i - 1;

        while (0 <= i_before && elem < elements[i_before]) {
            elements[i_before + 1] = elements[i_before];
            i_before--;
        }
        elements[i_before + 1] = elem;
        print_elements(length, elements);
    }
}

/* ALDS1_1_A: Insertion sort */
int main() {
    int length;
    cin >> length;

    int elements[length];
    for (int i = 0; i < length; i++) {
        cin >> elements[i];
    }

    print_elements(length, elements);
    insertion_sort(length, elements);

    return 0;
}
