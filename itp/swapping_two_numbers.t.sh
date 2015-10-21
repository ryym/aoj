#!/usr/bin/env bash

$1 $2 <<-EOF
2 1
0 0
EOF
echo ------

$1 $2 <<-EOF
3 2
2 2
5 3
4 5
0 0
EOF
echo ------
