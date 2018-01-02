/* ITP1_10_A: Distance */

#include <iostream>
#include <iomanip>
#include <cmath>

struct Point { double x, y; };

int main() {
    Point p1, p2;
    std::cin >> p1.x >> p1.y >> p2.x >> p2.y;

    double distance = sqrt( pow(p2.x - p1.x, 2) + pow(p2.y - p1.y, 2) );
    std::cout
        << std::fixed << std::setprecision(5)
        << distance
        << std::endl;

    return 0;
}
