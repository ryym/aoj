#include <iostream>
#include <cstdlib>
#include <vector>
using namespace std;

const int MAX_SIZE = 200;

// A simplest stack.
class stack {
    public: 
        stack();
        ~stack();
        void push(int value);
        int pop();
        bool is_empty();
        bool is_full();
    private:
        int current;
        int *values;
};

stack::stack() {
    current = -1;
    values = (int*)malloc( sizeof(int) * MAX_SIZE );
}

stack::~stack() {
    free(values);
    values = NULL;
}

void stack::push(int value) {
    if (is_full())
        throw "\nStack is full.";
    values[ ++current ] = value;
}

int stack::pop() {
    if (is_empty())
        throw "\nStack is empty.";
    return values[ current-- ];
}

bool stack::is_empty() {
    return current == -1;
}

bool stack::is_full() {
    return current == MAX_SIZE - 1;
}

// Evaluate the expression.
int evaluate(vector<string>& expr) {
    stack results;
    for (int i = 0; i < expr.size(); i++) {
        string op = expr[i];
        int left, right;

        if (op == "+") {
            right = results.pop();
            left  = results.pop();
            results.push( left + right );
        }
        else if (op == "-") {
            right = results.pop();
            left  = results.pop();
            results.push( left - right );
        }
        else if (op == "*") {
            right = results.pop();
            left  = results.pop();
            results.push( left * right );
        }
        else {
            results.push( std::stoi(op) );
        }
    }
    return results.pop();
}

/* ALDS1_3_A: Stack */
int main() {
    try {
        string op;
        vector<string> expr;
        while (! (cin >> op).eof() ) {
            expr.push_back(op);
        }

        cout << evaluate(expr) << endl;
    } catch(char const *message) {
        cout << message << endl;
    }

    return 0;
}
