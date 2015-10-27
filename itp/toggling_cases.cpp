/* ITP1_8_A: Toggling Cases */

#include <iostream>
#include <algorithm>
#include <string>
using namespace std;

char toggle_case(char c) {
    if ('a' <= c && c <= 'z')
        return toupper(c);
    else if ('A' <= c && c <= 'Z')
        return tolower(c);
    else
        return c;
}

int main() {
    string s;
    getline(cin, s);
    transform(s.begin(), s.end(), s.begin(), toggle_case);
    cout << s << endl;
    return 0;
}
