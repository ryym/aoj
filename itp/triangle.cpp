// a, b, C,  残りの辺 d, 底辺をaとした時の高さ h
// S = (1 / 2) bc * sin C
// d^2 = a^2 + b^2 - 2ab cos C
// h = b * sin C

/* ITP1_10_B: Triangle */

#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

int main() {
    double a, b;
    int C;
    cin >> a >> b >> C;

    double th = C * M_PI / 180.0;
    double S = (a * b / 2) * sin(th);
    double L = a + b + sqrt( pow(a, 2) + pow(b, 2) - 2 * a * b * cos(th) );
    double h = b * sin(th);

    cout << fixed << setprecision(5)
         << S << endl
         << L << endl
         << h << endl;

    return 0;
}
