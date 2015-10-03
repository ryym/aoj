// O(n)
// はじめから一つずつ値を走査し、その時点までの最小値と、
// その時点までの最小値との差分の最大値(絶対値的にではなく)を
// 保持するようにすればいい。価格そのもの最大値ではなく、自身より
// 前の価格との差分の最大値を保持するという考え方が大事。
// 最大差分、最小価格の初期値は、1つめの価格の読み取りでどのような
// 値が渡されてもそれで上書きされるよう適切な値を設定する必要がある。


#include <iostream>
using namespace std;

const int HIGHEST_RATE = 1000000000;
const int LOWEST_RATE  = 1;

/* ALDS 1_1_D: Maximum profit */
int main() {
    int n, rate, profit;
    int max_profit  = LOWEST_RATE - HIGHEST_RATE;
    int lowest_rate = HIGHEST_RATE * 2;

    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> rate;
        profit      = rate - lowest_rate;
        max_profit  = max(max_profit, profit);
        lowest_rate = min(lowest_rate, rate);
    }

    cout << max_profit << endl;
}
