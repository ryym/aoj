// シェルソート
// 一定の間隔gだけ離れた要素のみを対象に、少しずつ間隔を狭めながら
// 挿入ソートを繰り返す。最後に間隔1ずつ、つまり通常の挿入ソートを行う
// 段階である程度整列されていれば、挿入ソートの特性により高速に処理される
// 事が期待できる。


#include <iostream>
#include <cstdio>
#include <vector>
using namespace std;

void intervals(int max, vector<int>& G) {
    int g = 1;
    while (g <= max) {
        G.push_back(g);
        g = 3 * g + 1;
    }
}

int insertionSort(int N, int A[], int g) {
    int nSwapped = 0;
    for (int i = g; i < N; i++) {
        int v = A[i];
        int iBef = i - g;
        while (0 <= iBef && v < A[iBef]) {
            A[iBef + g] = A[iBef];
            iBef -= g;
            nSwapped++;
        }
        A[iBef + g] = v;
    }
    return nSwapped;
}

int shellSort(int N, int A[], vector<int>& G) {
    int nSwapped = 0;
    for (int i = G.size() - 1; i >= 0; i--) {
        nSwapped += insertionSort(N, A, G[i]);
    }
    return nSwapped;
}

/* ALDS1_2_D: Shell Sort */
int main() {
    int N;
    cin >> N;

    int A[N];
    for (int i = 0; i < N; i++)
        scanf("%d\n", &A[i]);

    vector<int> G;
    intervals(N, G);

    int nSwapped = shellSort(N, A, G);

    cout << G.size() << endl << G.back();
    for (int i = G.size() - 2; i >= 0; i--)
        printf(" %d", G[i]);
    cout << endl;

    cout << nSwapped << endl;
    for (int i = 0; i < N; i++)
        printf("%d\n", A[i]);

    return 0;
}
