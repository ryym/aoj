#!/usr/bin/env bash

$1 $2 <<-EOF
10
4 1 3 2 16 9 10 14 8 7
EOF
echo ------

$1 $2 <<-EOF
1
10
EOF
echo ------

$1 $2 <<-EOF
6
-2000000000 -1 0 1 2000000000 199999999
EOF
echo ------
