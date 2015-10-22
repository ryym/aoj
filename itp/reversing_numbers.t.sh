#!/usr/bin/env bash

$1 $2 <<-EOF
6
0 1 2 3 4 5
EOF
echo ------

$1 $2 <<-EOF
8
3 3 4 4 5 8 7 9
EOF
echo ------
