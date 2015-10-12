// 与えられたヒープをmax-ヒープに変換する。
// 各要素について自身と左右の子のうち最大のものを根に置く作業
// (そして小さい値を再帰的に下層へ移動する作業)を、
// 最下層からボトムアップに行っていく事で実現する。
// そうする事で、ある要素を左右の子と比較する時、それら左右の子は
// それぞれ左・右部分木のうち最大の要素となっているようにする。
// build_max_heap() の H/2 は、子を持つ節点の中で添字が最大の節点の添字。

/* ALDS1_9_B: Maximum Heap */

#include <iostream>

void max_heapify(int H, int A[], int i) {
    int il = i * 2;
    int ir = i * 2 + 1;

    int max_i = i;
    if (il <= H && A[i] < A[il])
        max_i = il;
    if (ir <= H && A[max_i] < A[ir])
        max_i = ir;

    if (max_i != i) {
        std::swap(A[i], A[max_i]);
        max_heapify(H, A, max_i);
    }
}

void build_max_heap(int H, int A[]) {
    for (int i = H / 2; i >= 1; i--)
        max_heapify(H, A, i);
}

int main() {
    std::ios::sync_with_stdio(false);

    int H;
    std::cin >> H;

    int heap[H + 1];
    for (int i = 1; i <= H; i++)
        std::cin >> heap[i];

    build_max_heap(H, heap);

    for (int i = 1; i <= H; i++)
        std::cout << " " << heap[i];
    std::cout << std::endl;

    return 0;
}
