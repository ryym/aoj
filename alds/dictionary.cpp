// 自前の超簡易ハッシュを作る
//
// 与えられるキーは4種類の文字からなり、最大12文字と決まっている。
// このキーのとりうる文字列パターン全てに対応するハッシュを
// 効率的に作成・保持できればいい。
// 毎回必ず12桁になるのであれば 4^12 が全パターン数になるが、
// 文字数は 1 ～ 12 の範囲を取るのでそれだけでは足りない。
// 例えば文字が A,B,C のいずれかで、キーの長さが最大3つだった場合、
//  いずれかの文字1つを使って作れる全ての文字列、
//  2つを使って作れる全ての文字列、
//  3つを使って作れる全ての文字列
// の全てのパターンの合計を考えなければいけない。
//  (3 ^ 1 + 3 ^ 2 + 3 ^ 3)
// よって同じように 4^1 + 4^2 + .. + 4^12 が全パターン数となる。
// 後は各パターンに一意な数値を与えればいい。4進数の要領で
// 値を増やしていけば最小の配列でハッシュの一意性を保証できる。


/* ALDS1_4_C: Dictionary */

#include <iostream>
#include <cstdio>

const int MAX_KEY_LENGTH = 12;
const int N_KEY_CHARS = 4;

class Dict {
    int *KEYS;
    int char_to_id(char);
    int to_hash(char*);
    public:
        Dict();
        void insert(char*);
        bool has(char*);
};

Dict::Dict() {
    int max_hash = 0, w = 1;
    for (int i = 0; i < MAX_KEY_LENGTH; i++, w *= N_KEY_CHARS) {
        max_hash += N_KEY_CHARS * w;
    }
    KEYS = new int[max_hash + 1];
    std::fill_n(KEYS, max_hash, 0);
}

void Dict::insert(char *key) {
    KEYS[ to_hash(key) ] = true;
}

bool Dict::has(char *key) {
    return KEYS[ to_hash(key) ];
}

int Dict::char_to_id(char c) {
    switch (c) {
        case 'A': return 1;
        case 'C': return 2;
        case 'G': return 3;
        case 'T': return 4;
    }
    return 0;
}

int Dict::to_hash(char *key) {
    int hash = 0;
    int w = 1;
    for (int i = 0; key[i]; i++, w *= N_KEY_CHARS) {
        hash += w * char_to_id(key[i]);
    }
    return hash;
}

int main() {
    int n_ops;
    scanf("%d", &n_ops);

    Dict dict;
    char op[10], key[MAX_KEY_LENGTH + 1];

    for (int i = 0; i < n_ops; i++) {
        scanf("%s %s", op, key);
        switch (op[0]) {
            case 'i': // insert
                dict.insert(key);
                break;
            case 'f': // find
                puts( dict.has(key) ? "yes" : "no" );
                break;
        }
    }

    return 0;
}
