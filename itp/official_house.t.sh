#!/usr/bin/env bash

$1 $2 <<-EOF
3
1 1 3 8
3 2 2 7
4 3 8 1
EOF
echo ------

$1 $2 <<-EOF
0
EOF
echo ------

$1 $2 <<-EOF
2
1 1 1 9
1 1 1 -9
EOF
echo ------

$1 $2 <<-EOF
4
4 3 10 5
1 1 1 8
3 2 5 2
4 3 10 4
EOF
echo ------
