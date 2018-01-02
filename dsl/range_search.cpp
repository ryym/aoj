/* DSL_2_C: Range Search (kD Tree) */

#include <cstdio>
#include <algorithm>
#include <vector>
using namespace std;

class Node {
    public:
        int location;
        int p, l, r;
        Node() {}
};

class Point {
    public:
        int id, x, y;
        Point() {}
        Point(int id, int x, int y):
            id(id), x(x), y(y) {}

        bool operator < (const Point &p) const {
            return id < p.id;
        }
};

static const int MAX = 1000000;
static const int NIL = -1;

Point P[MAX];
Node T[MAX];
int np;

bool lessX(const Point &p1, const Point &p2) { return p1.x < p2.x; }
bool lessY(const Point &p1, const Point &p2) { return p1.y < p2.y; }

int makeKDTree(int l, int r, int depth) {
    if (r <= l) return NIL;

    if (depth % 2 == 0) {
        sort(P + l, P + r, lessX);
    } else {
        sort(P + l, P + r, lessY);
    }

    int mid = (l + r) / 2;
    int t = np++;
    T[t].location = mid;
    T[t].l = makeKDTree(l, mid, depth + 1);
    T[t].r = makeKDTree(mid + 1, r, depth + 1);

    return t;
}

void find(int v, int sx, int tx, int sy, int ty, int depth, vector<Point> &ans) {
    Node node = T[v];
    int x = P[node.location].x;
    int y = P[node.location].y;

    if (sx <= x && x <= tx && sy <= y && y <= ty) {
        ans.push_back(P[node.location]);
    }

    if (depth % 2 == 0) {
        if (node.l != NIL && sx <= x) {
            find(node.l, sx, tx, sy, ty, depth + 1, ans);
        }
        if (node.r != NIL && x <= tx) {
            find(node.r, sx, tx, sy, ty, depth + 1, ans);
        }
    } else {
        if (node.l != NIL && sy <= y) {
            find(node.l, sx, tx, sy, ty, depth + 1, ans);
        }
        if (node.r != NIL && y <= ty) {
            find(node.r, sx, tx, sy, ty, depth + 1, ans);
        }
    }
}

int main() {
    int x, y, n_points;
    scanf("%d", &n_points);
    for (int i = 0; i < n_points; i++) {
        scanf("%d %d", &x, &y);
        P[i] = Point(i, x, y);
        T[i].l = T[i].r = T[i].p = NIL;
    }

    np = 0;
    int root = makeKDTree(0, n_points, 0);

    int n_queries;
    scanf("%d", &n_queries);

    int sx, tx, sy, ty;
    vector<Point> ans;
    for (int i = 0; i < n_queries; i++) {
        scanf("%d %d %d %d ", &sx, &tx, &sy, &ty);
        ans.clear();
        find(root, sx, tx, sy, ty, 0, ans);
        sort(ans.begin(), ans.end());
        for (int i_a = 0; i_a < ans.size(); i_a++) {
            printf("%d\n", ans[i_a].id);
        }
        printf("\n");
    }

    return 0;
}
