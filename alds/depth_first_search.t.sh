#!/usr/bin/env bash

$1 $2 <<-EOF
4
1 1 2
2 1 4
3 0
4 1 3
EOF
echo ------

$1 $2 <<-EOF
6
1 2 2 3
2 2 3 4
3 1 5
4 1 6
5 1 6
6 0
EOF
echo ------

$1 $2 <<-EOF
6
1 2 2 4
2 1 5
3 2 5 6
4 0
5 1 4
6 1 6
EOF
echo ------
