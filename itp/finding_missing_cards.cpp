// 行を絵柄、列を数字に見立てて 4 * 13 の2次元配列cardsを作る。
// 次に入力値をcardsの該当する場所に格納していく。
// 終わったらcardsを走査して値が入っていない場所が答え。
// 絵柄とそれを表す添字の相互変換が必要。

/* ITP1_6_B: Finding missing cards */

#include <iostream>
#include <cstdio>

const int N_ALL_CARDS = 52;
const int N_SUITS     = 4;
const int N_NUMBERS   = 13;

int suit_to_idx(int suits[], char suit) {
    for (int i = 0; i < N_SUITS; i++)
        if (suits[i] == suit) return i;
    return -1;
}

int main() {
    int n_cards;
    std::cin >> n_cards;
    if (n_cards == N_ALL_CARDS)
        return 0;

    int suits[N_SUITS] = { 'S', 'H', 'C', 'D' };
    int cards[N_SUITS][N_NUMBERS] = {};
    char suit;
    int number;

    for (int i = 0; i < n_cards; i++) {
        std::cin >> suit >> number;
        int suit_idx = suit_to_idx(suits, suit);
        cards[suit_idx][number - 1] = 1;
    }

    for (int i_s = 0; i_s < N_SUITS; i_s++) {
        for (int i_n = 0; i_n < N_NUMBERS; i_n++) {
            if ( cards[i_s][i_n] == 0 ) {
                printf("%c %d\n", suits[i_s], i_n + 1);
            }
        }
    }

    return 0;
}
