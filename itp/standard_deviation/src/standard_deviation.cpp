/* ITP1_10_C: Standard Deviation */

#include <iostream>
#include <cstdio>
#include <cmath>
#include <numeric>
using namespace std;

double calc_stdv(int n_students, int scores[]) {
    double sum = accumulate(scores, scores + n_students, 0);
    double average = sum / n_students;
    double var = 0;

    for (int i = 0; i < n_students; i++)
        var += pow(average - scores[i], 2);
    
    return sqrt(var / n_students);
}

int main() {
    int n_students;
    while (true) {
        scanf("%d", &n_students);
        if (n_students == 0) break;

        int scores[n_students];
        for (int i = 0; i < n_students; i++)
            scanf("%d", &scores[i]);

        double stdv = calc_stdv(n_students, scores);
        printf("%.6f\n", stdv);
    }
    return 0;
}
