// バケツソートとも言う。
// 全ての要素が0以上でかつ要素の最大値 k がわかっている場合に使用できるアルゴリズム。
// 要素ごとに自身以下の値の数(= 整列時に自身が何番目に来るべきか)を
// カウントする事で並び替えを行う。並べ替え時に元の配列を後ろから走査する事で
// 安定なアルゴリズムとなる。要する時間は要素の数と最大値に比例する( O(n + k) )。
//
// ちなみに、今回の問題のように大きなサイズ(2000000)の配列を作る場合、普通に
// `int array[n]`のように宣言してしまうとスタックオーバーフローになるため、
// `int *array = new int[n]`のようにしてヒープ上にメモリを確保する必要がある。


/* ALDS1_6_A: Counting Sort */

#include <iostream>
#include <cstdio>

const int MAX_VALUE = 10000;

void counting_sort(int n, int in[], int out[], int max) {
    int counts[max + 1];
    std::fill_n(counts, max + 1, 0);

    for (int i = 0; i < n; i++)
        counts[ in[i] ]++;

    for (int i_c = 1; i_c <= max; i_c++)
        counts[i_c] += counts[i_c - 1];

    for (int i = n - 1; 0 <= i; i--) {
        out[ counts[in[i]] - 1 ] = in[i];
        counts[ in[i] ]--;
    }
}

int main() {
    int n;
    scanf("%d", &n);

    int *in = new int[n];
    for (int i = 0; i < n; i++)
        scanf("%d", &in[i]);

    int *out = new int[n];
    counting_sort(n, in, out, MAX_VALUE);

    printf("%d", out[0]);
    for (int i = 1; i < n; i++)
        printf(" %d", out[i]);
    puts("");

    return 0;
}
