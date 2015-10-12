#!/usr/bin/env bash

$1 $2 <<-EOF
5
7 8 1 2 3
EOF
echo ------

$1 $2 <<-EOF
5
-2000000000 -1 0 1 2000000000
EOF
echo ------

$1 $2 <<-EOF
15
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
EOF
echo ------

$1 $2 <<-EOF
6
10 8 5 1 2 3
EOF
echo ------
