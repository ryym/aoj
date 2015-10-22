#!/usr/bin/env bash

$1 $2 <<-EOF
2 2
0 0
EOF
echo ------

$1 $2 <<-EOF
3 3
0 0
EOF
echo ------

$1 $2 <<-EOF
3 4
5 6
3 3
0 0
EOF
echo ------

$1 $2 <<-EOF
30 30
0 0
EOF
echo ------
