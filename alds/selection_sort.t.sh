#!/usr/bin/env bash

$1 $2 <<-EOF
6
5 6 4 2 1 3
EOF
echo ------

$1 $2 <<-EOF
6
5 2 4 6 1 3
EOF
echo ------

$1 $2 <<-EOF
10
10 9 8 7 6 5 4 3 2 1
EOF
echo ------

$1 $2 <<-EOF
10
1 2 3 4 5 6 7 8 9 10
EOF
echo ------
