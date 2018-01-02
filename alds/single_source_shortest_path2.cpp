// ALDS1_12_B: Single Source Shortest Path 2

/* Single Source Shortest Path 2 */

// ダイクストラのアルゴリズムを、優先度付きキューによって高速化する。

#include <iostream>
#include <algorithm>
#include <queue>
using namespace std;

// first: cost, second: key
typedef pair<int, int> vert;

static const int MAX   = 10000;
static const int INFTY = 1 << 20;
static const int WHITE = 0;
static const int BLACK = 2;

vector<vert> adjs[MAX];
int costs[MAX];

void dijkstra(int n_v, int v_start) {
    priority_queue< vert, vector<vert>, greater<vert> > visitings;
    int color[MAX];

    for (int i = 0; i < n_v; i++) {
        costs[i] = INFTY;
        color[i] = WHITE;
    }

    costs[v_start] = 0;
    visitings.push( make_pair(0, v_start) );

    while (! visitings.empty()) {
        vert nearest = visitings.top();
        visitings.pop();

        int next_id = nearest.second;
        color[next_id] = BLACK;

        // 同じ頂点が複数回キューに追加されうるため、既により短い
        // next_id への経路が獲得できている場合は何もしないようにする。
        if ( costs[next_id] < nearest.first )
            continue;

        for (int i = 0; i < adjs[next_id].size(); i++) {
            int adj  = adjs[next_id][i].first;
            int cost = adjs[next_id][i].second;

            if (color[adj] == BLACK)
                continue;

            if (costs[next_id] + cost < costs[adj]) {
                costs[adj] = costs[next_id] + cost;
                visitings.push( make_pair(costs[adj], adj) );
            }
        }
    }
}

int main() {
    std::ios::sync_with_stdio(false);

    int n_v;
    cin >> n_v;

    for (int i = 0; i < n_v; i++) {
        int vert_id, n_adjs;
        cin >> vert_id >> n_adjs;

        for (int j = 0; j < n_adjs; j++) {
            int adj, cost;
            cin >> adj >> cost;
            adjs[vert_id].push_back( make_pair(adj, cost) );
        }
    }

    dijkstra(n_v, 0);

    for (int i = 0; i < n_v; i++) {
        cout << i << " " << costs[i] << "\n";
    }
}
