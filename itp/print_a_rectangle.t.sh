#!/usr/bin/env bash

$1 $2 <<-EOF
3 4
5 6
2 2
0 0
EOF
echo ------

$1 $2 <<-EOF
0 0
EOF
echo ------

$1 $2 <<-EOF
1 1
0 0
EOF
echo ------
