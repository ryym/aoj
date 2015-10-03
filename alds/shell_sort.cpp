// シェルソート
// 一定の間隔gだけ離れた要素のみを対象に、少しずつ間隔を狭めながら
// 挿入ソートを繰り返す。最後に間隔1ずつ、つまり通常の挿入ソートを行う
// 段階である程度整列されていれば、挿入ソートの特性により高速に処理される
// 事が期待できる。


#include <iostream>
using namespace std;

void trace(int N, int A[]) {
    if (N <= 0) return;
    cout << A[0];
    for (int i = 1; i < N; i++)
        cout << " " << A[i];
    cout << endl;
}

int intervalSize(int max) {
    int n = 1;
    int g = 1;
    while ( (g = 3 * g + 1) <= max) n++;
    return n;
}

void intervals(int gn, int gs[]) {
    if (gn <= 0) return;
    gs[gn - 1] = 1;
    for (int i = gn - 1; i > 0; i--) {
        gs[i - 1] = 3 * gs[i] + 1;
    }
}

int insertionSort(int N, int A[], int g) {
    int n_swapped = 0;
    for (int i = g; i < N; i++) {
        int v = A[i];
        int iBef = i - g;
        while (0 <= iBef && v < A[iBef]) {
            A[iBef + g] = A[iBef];
            iBef -= g;
            n_swapped++;
        }
        A[iBef + g] = v;
    }
    return n_swapped;
}

int shellSort(int N, int A[], int gn, int gs[]) {
    int n_swapped = 0;
    for (int i = 0; i < gn; i++) {
        n_swapped += insertionSort(N, A, gs[i]);
    }
    return n_swapped;
}

/* ALDS1_2_D: Shell Sort */
int main() {
    int N;
    cin >> N;

    int A[N];
    for (int i = 0; i < N; i++)
        cin >> A[i];

    int gn = intervalSize(N);
    int gs[gn];
    intervals(gn, gs);

    int n_swapped = shellSort(N, A, gn, gs);

    // Output results.
    cout << gn << endl;
    trace(gn, gs);
    cout << n_swapped << endl;
    for (int i = 0; i < N; i++)
        cout << A[i] << endl;

    return 0;
}
