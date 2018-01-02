/* ITP1_10_C: Distance 2 */

#include <iostream>
#include <iomanip>
#include <cmath>

double minkowski_distance(int p, int n, int vx[], int vy[]) {
    double d = 0;
    for (int i = 0; i < n; i++) {
        int abs = std::abs( vx[i] - vy[i] );
        d += std::pow((double)abs, p);
    }
    // calculate the `p`th root of the `d`.
    return std::pow(d, 1.0 / p);
}

double chebyshev_distance(int n, int vx[], int vy[]) {
    double d = 0;
    for (int i = 0; i < n; i++) {
        int abs = std::abs( vx[i] - vy[i] );
        if (d < abs) d = abs;
    }
    return d;
}

int main() {
    std::ios::sync_with_stdio(false);

    int n;
    std::cin >> n;

    int vx[n];
    for (int i = 0; i < n; i++)
        std::cin >> vx[i];

    int vy[n];
    for (int i = 0; i < n; i++)
        std::cin >> vy[i];

    std::cout
        << std::fixed << std::setprecision(6)
        << minkowski_distance(1, n, vx, vy) << "\n"
        << minkowski_distance(2, n, vx, vy) << "\n"
        << minkowski_distance(3, n, vx, vy) << "\n"
        << chebyshev_distance(n, vx, vy) << "\n";

    return 0;
}
