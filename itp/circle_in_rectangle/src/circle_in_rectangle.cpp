// 与えられる x, y, r が以下の条件を全て満たせば
// 円は長方形の中にある。
// 0 <= x <= W
// 0 <= y <= H
// x + r <= W && 0 <= x - r
// y + r <= H && 0 <= y - r
//
// r == 0 がありうる ..?


/* ITP1_2_D: Circle in a Rectangle */

#include <iostream>
using namespace std;

bool between(int from, int v, int to) {
    return from <= v && v <= to;
}

int main() {
    int W, H, x, y, r, c_x = 0, c_y = 0;
    cin >> W >> H >> x >> y >> r;

    bool is_inside = between(c_x + r, x, W - r) && between(c_y + r, y, H - r);
    cout << ( is_inside ? "Yes" : "No" ) << endl;
    return 0;
}
