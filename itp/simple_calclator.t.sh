#!/usr/bin/env bash

$1 $2 <<-EOF
1 + 1
3 - 2
2 * 4
9 / 3
0 ? 0
EOF
echo ------

$1 $2 <<-EOF
1 + 2
56 - 18
13 * 2
100 / 10
27 + 81
0 ? 0
EOF
echo ------
