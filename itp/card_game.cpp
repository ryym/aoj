// 辞書順で大きい方 = 辞書の並びでより後に来る方 = 勝ち
// 両者が同じ単語である場合のみ引き分け
//
// 文字列を1文字ずつ比べる。
//   いずれかの文字が大きければ大きい方の勝ち
//   いずれかの文字が尽きた場合、文字が残っている方の勝ち
//   同じなら次の文字へ

/* ITP1_9_C: Card Game */

#include <iostream>
#include <string>

const int WINNING_POINTS = 3;

int main() {
    std::ios::sync_with_stdio(false);

    std::string word1;
    std::string word2;
    int taro_points = 0, hanako_points = 0;
    int n_fights;

    std::cin >> n_fights;
    for (int i = 0; i < n_fights; i++) {
        std::cin >> word1 >> word2;
        if (word1 > word2) {
            taro_points += WINNING_POINTS;
        }
        else if (word1 < word2) {
            hanako_points += WINNING_POINTS;
        }
        else {
            taro_points++;
            hanako_points++;
        }
    }

    std::cout << taro_points << " " << hanako_points << std::endl;
    return 0;
}
