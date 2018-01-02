// 配列によるQueueの実装
//
// Queueの先頭を指し示すポインタheadと末尾の次の要素(次にenqueueされる値が入る場所)を
// 指し示すポインタtailを用意する。要素が取り出されたら head++, 追加されたら tail++。
// head == tail の時はQueueが空ということ。ただしこれでは取り出された後の配列の領域が
// 無駄になるため、配列をリングバッファとして扱うようにする。tail が配列末尾に達したら0に
// リセットし、続く要素は配列の頭から格納し直していく。head - tail == 1 になったら(headの
// 2つ前にtailが来たら)Queueは満杯とする(tailをheadに追いつかせてしまうと、空なのか満杯なのか
// 区別できないため)。

// 与えられるプロセスをQueueに格納
// 順番に処理していき、クォンタム以内に終わらないものは再度Queueへ。
// (あるいは、終わらなかったもののみQueueへ入れてもいいのかも)。
// 後は全てのプロセスが終わるまでQueueをループ。
// 終わったプロセスを終了タイムとともに順に結果配列へ格納しておき、
// 最後にそれを出力する。
//
// 経過時間　処理開始から一つのプロセスを処理するごとにプラスされる。
// そのプロセスがクォンタム以内に終わればそのプロセスの処理時間を、
// 終わらなければクォンタム分を追加する。

#include <iostream>
#include <cstdlib>
#include <queue>
using namespace std;

struct Process {
    string name;
    int time;
};

/* ALDS1_3_B: Queue */
int main() {
    int n, quantum;
    cin >> n >> quantum;

    queue<Process*> pqueue;
    Process *ps;

    for (int i = 0; i < n; i++) {
        ps = new Process();
        cin >> ps->name >> ps->time;
        pqueue.push(ps);
    }

    int elapsed = 0;
    while(! pqueue.empty() ) {
        ps = pqueue.front();
        pqueue.pop();

        if (quantum < ps->time) {
            elapsed += quantum;
            ps->time -= quantum;
            pqueue.push(ps);
        } else {
            elapsed += ps->time;
            cout << ps->name << " " << elapsed << endl;
        }
    }
    free(ps);

    return 0;
}
