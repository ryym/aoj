/* DSL1_A: Disjoint Set */

// Solve using Union-Find Tree

#include <iostream>
#include <cstdio>

int *parents;
int *ranks;

int find(int x) {
    if (parents[x] == x)
        return x;
    else
        return parents[x] = find( parents[x] );
}

void unite(int x, int y) {
    x = find(x);
    y = find(y);
    if ( ranks[x] < ranks[y] ) {
        parents[x] = y;
    }
    else if ( ranks[y] < ranks[x] ) {
        parents[y] = x;
    }
    else if (x != y) {
        parents[x] = y;
        ranks[y] += 1;
    }
}

int main() {
    int n, q;
    scanf("%d %d", &n, &q);

    parents = new int[n];
    ranks   = new int[n];
    for (int i = 0; i < n; i++) {
        parents[i] = i;
        ranks[i]   = 0;
    }

    int command, x, y;
    for (int i = 0; i < q; i++) {
        scanf("%d %d %d\n", &command, &x, &y);
        switch (command) {
            case 0:
                unite(x, y);
                break;
            case 1:
                printf("%d\n", find(x) == find(y));
                break;
        }
    }

    return 0;
}

