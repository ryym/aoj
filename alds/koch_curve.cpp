// 一つの線分を受け取り、それを４つの線分に分解する関数
// 分解された各線分に対して自身を再帰呼び出しする。その際深さをひとつ減らす。
// 最初に与えられた深さが0になったら終了。
//
// 点s,tの(x,y)はそれぞれ、p2.x-p1.x と p2.y-p1.y の 1/3(s), 2/3(t) 地点のポイントとなる。
//
// 2つの数値 a, b の 1/3 地点の数値 c は以下の式で求まる。
// c = a + (b - a) / 3
//   = (3a + b - a) / 3
//   = (2a + b) / 3
// 同様に、2/3 地点の数値 d は以下で求まる。
// d = b - (b - a) / 3
//   = (3b - b + a) / 3
//   = (a + 2b) / 3
// 
// 上記の式は、a, b の大小関係に関係なく正しい数値を算出できる。
// 点u を求めるには、正体不明の回転行列なるものを用いる。


/* ALDS1_5_B: Koch Curve */

#include <iostream>
#include <vector>
#include <cstdio>
#include <cmath>
using std::vector;

const double T_RAD = 60 * M_PI / 180.0;

struct Point {
    double x, y;
    Point(double _x, double _y) : x(_x), y(_y) {};
};

double one_third_in(double b, double e) {
    return (2 * b + e) / 3;
}

double two_thirds_in(double b, double e) {
    return (b + 2 * e) / 3;
}

double lotate_x(Point& a, Point& b) {
    return (b.x - a.x) * cos(T_RAD) - (b.y - a.y) * sin(T_RAD) + a.x;
}

double lotate_y(Point& a, Point& b) {
    return (b.x - a.x) * sin(T_RAD) + (b.y - a.y) * cos(T_RAD) + a.y;
}

void koch(int depth, vector<Point>& points, Point& p1, Point& p2) {
    if (depth == 0) return;

    Point s( one_third_in(p1.x, p2.x), one_third_in(p1.y, p2.y) );
    Point t( two_thirds_in(p1.x, p2.x), two_thirds_in(p1.y, p2.y) );
    Point u( lotate_x(s, t), lotate_y(s, t) );
    int next_depth = depth - 1;

    koch(next_depth, points, p1, s);
    points.push_back(s);

    koch(next_depth, points, s, u);
    points.push_back(u);

    koch(next_depth, points, u, t);
    points.push_back(t);

    koch(next_depth, points, t, p2);
}

int main() {
    int depth;
    scanf("%d", &depth);

    vector<Point> points;
    Point p1(0, 0), p2(100, 0);

    points.push_back(p1);
    koch(depth, points, p1, p2);
    points.push_back(p2);

    for (int i = 0; i < points.size(); i++) {
        Point& p = points[i];
        printf("%.8f %.8f\n", p.x, p.y);
    }

    return 0;
}
