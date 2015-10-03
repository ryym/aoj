/* ALDS1_5_A: Exhaustive Search */

#include <iostream>

const int MAX_GOAL = 2000;

int N;
int *S;

void prepare(int makables[], int i, int sum) {
    if (sum <= MAX_GOAL) {
        makables[sum] = true;
        if (i == N) return;
        prepare(makables, i + 1, sum);
        prepare(makables, i + 1, sum + S[i]);
    }
}

int main() {
    std::ios::sync_with_stdio(false);

    std::cin >> N;
    S = new int[N];
    for (int i = 0; i < N; i++)
        std::cin >> S[i];

    int makables[MAX_GOAL + 1] = {};
    prepare(makables, 0, 0);

    int n_goals;
    std::cin >> n_goals;

    int goal;
    for (int i = 0; i < n_goals; i++) {
        std::cin >> goal;
        std::cout << ( makables[goal] ? "yes" : "no" ) << "\n";
    }
}

/* bool find(int i, int goal) { */
/*     if (goal == 0) */
/*         return true; */
/*     if (i == N) */
/*         return false; */
/*     return find(i + 1, goal - S[i]) || find(i + 1, goal); */
/* } */

/* bool find(int goal_num, int sum_before, int start) { */
/*     for (int i = start; i < N; i++) { */
/*         int sum = sum_before + S[i]; */
/*         if ( sum == goal_num || find(goal_num, sum, i + 1) ) */
/*             return true; */
/*     } */
/*     return false; */
/* } */

