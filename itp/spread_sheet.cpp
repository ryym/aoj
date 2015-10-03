/* IPT1_7_C: Spread Sheet */

#include <iostream>

int main() {
    int n_row, n_col;
    std::cin >> n_row >> n_col;

    int table[n_row + 1][n_col + 1];
    for (int row = 0; row < n_row; row++) {
        for (int col = 0; col < n_col; col++) {
            std::cin >> table[row][col];
        }
    }

    int sum_per_rows[n_row];
    int sum_per_cols[n_col];
    int sum_all = 0;
    std::fill_n(sum_per_rows, n_row, 0);
    std::fill_n(sum_per_cols, n_col, 0);

    for (int row = 0; row < n_row; row++) {
        for (int col = 0; col < n_col; col++) {
            int cell = table[row][col];
            sum_per_rows[row] += cell;
            sum_per_cols[col] += cell;
            sum_all += cell;
        }
        table[row][n_col] = sum_per_rows[row];
    }
    table[n_row][n_col] = sum_all;

    for (int col = 0; col < n_col; col++) {
        table[n_row][col] = sum_per_cols[col];
    }

    for (int row = 0; row <= n_row; row++) {
        std::cout << table[row][0];
        for (int col = 1; col <= n_col; col++) {
            std::cout << " " << table[row][col];
        }
        std::cout << std::endl;
    }
}
