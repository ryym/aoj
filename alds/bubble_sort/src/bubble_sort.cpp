// The ★ Bubble sort
// 挿入ソートの場合は、未ソート部分列の先頭をソート済み部分列の適切な位置に
// 挿入していくが、バブルソートでは未ソート部分列の隣接する値同士を比べて
// 必要なら適切な順序になるよう１つずつ交換していく。


#include <iostream>
using namespace std;

void print_elements(int length, int elements[]) {
    cout << elements[0];
    for (int i = 1; i < length; i++) {
        cout << " " << elements[i];
    }
    cout << endl;
}

// Return how many times elements were swapped.
int bubble_sort(int N, int elements[]) {
    int i_sorted  = 0;
    int n_swapped = 0;
    bool swapped  = true;

    while (swapped) {
        swapped = false;
        for (int i = N - 1; i > i_sorted; i--) {
            int i_before = i - 1;
            if (elements[i] < elements[i_before]) {
                std::swap(elements[i], elements[i_before]);
                swapped = true;
                n_swapped++;
            }
        }
        i_sorted++;
    }
    return n_swapped;
}

/* ALDS1_2_A: Bubble Sort */
int main() {
    int N;
    cin >> N;

    int elements[N];
    for (int i = 0; i < N; i++) {
        cin >> elements[i];
    }

    int n_swapped = bubble_sort(N, elements);

    print_elements(N, elements);
    cout << n_swapped << endl;
    return 0;
}
