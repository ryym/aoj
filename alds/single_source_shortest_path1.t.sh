#!/usr/bin/env bash

$1 $2 <<-EOF
5
0 3 2 3 3 1 1 2
1 2 0 2 3 4
2 3 0 3 3 1 4 1
3 4 2 1 0 1 1 4 4 3
4 2 2 1 3 3
EOF
echo ------

$1 $2 <<-EOF
3
0 2 1 1 2 2
1 0
2 0
EOF
echo ------

$1 $2 <<-EOF
3
0 2 1 1 2 10
1 1 2 1
2 0
EOF
echo ------

$1 $2 <<-EOF
3
0 2 1 99998 2 100000
1 1 2 1
2 0
EOF
echo ------

$1 $2 <<-EOF
10
0 2 1 1 2 3
1 2 3 3 2 1
2 2 3 1 6 10
3 1 4 1
4 1 7 1
5 2 3 1 6 1
6 2 3 1 8 1
7 2 5 1 8 4
8 1 9 100000
9 0
EOF
echo ------

