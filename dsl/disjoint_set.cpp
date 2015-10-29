/* DSL1_A: Disjoint Set */

// 連結リストによるぎこちない実装

#include <iostream>
#include <cstdio>

class Node {
    public:
        const int value;
        Node* prev;
        Node* next;

        Node(int value): value(value) {}
        ~Node() {
            delete prev;
            delete next;
        }
};

class LinkedList {
    Node* guard;
    int _size;

    public:
        const int id;

        LinkedList(int id, Node* first): id(id) {
            guard = new Node(-1);
            guard->next = first;
            guard->prev = first;
            first->next = guard;
            first->prev = guard;
            _size = 1;
        }

        ~LinkedList() {
            delete guard;
        }

        void append_all(LinkedList* other) {
            last()->next = other->first();
            other->first()->prev = last();

            guard->prev  = other->last();
            other->last()->next  = guard;

            _size += other->size();
        }

        Node* first() {
            return guard->next;
        }

        Node* last() {
            return guard->prev;
        }

        bool is_end(Node* node) {
            return node == guard;
        }

        int size() {
            return _size;
        }
};

LinkedList **SETs;

void unite(int x, int y) {
    if ( SETs[x] == SETs[y] ) return;

    bool is_x_bigger = SETs[x]->size() >= SETs[y]->size();
    LinkedList* main = is_x_bigger ? SETs[x] : SETs[y];
    LinkedList* sub  = is_x_bigger ? SETs[y] : SETs[x];

    Node* node = sub->first();
    while(! sub->is_end(node)) {
        SETs[ node->value ] = main;
        node = node->next;
    }
    main->append_all(sub);
}

bool same(int x, int y) {
    return SETs[x]->id == SETs[y]->id;
}

void create_sets(int n) {
    for (int i = 0; i < n; i++) {
        Node *node = new Node(i);
        LinkedList *set = new LinkedList(i, node);
        SETs[i] = set;
    }
}

int main() {
    int n, q;
    scanf("%d %d\n", &n, &q);

    SETs = new LinkedList*[n];
    create_sets(n);

    int command, x, y;
    for (int i = 0; i < q; i++) {
        scanf("%d %d %d\n", &command, &x, &y);
        switch (command) {
            case 0:
                unite(x, y);
                break;
            case 1:
                printf("%d\n", same(x, y));
                break;
        }
    }
    return 0;
}

