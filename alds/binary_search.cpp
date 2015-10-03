/* ALDS1_4_B: Binary Search */

#include <cstdio>

bool bin_search(int array[], int target, int from, int to) {
    if (to <= from) return false;

    int mid = (from + to) / 2;
    if (target == array[mid])
        return true;
    else if (target < array[mid])
        return bin_search(array, target, from, mid);
    else
        return bin_search(array, target, mid + 1, to);
}

int main() {
    int n_s;
    scanf("%d", &n_s);

    int S[n_s];
    for (int i = 0; i < n_s; i++)
        scanf("%d", &S[i]);

    int n_t;
    scanf("%d", &n_t);

    int T[n_t];
    for (int i = 0; i < n_t; i++)
        scanf("%d", &T[i]);

    int n_commons = 0;
    for (int i_t = 0; i_t < n_t; i_t++) {
        n_commons += bin_search(S, T[i_t], 0, n_s) ? 1 : 0;
    }
    printf("%d\n", n_commons);

    return 0;
}
