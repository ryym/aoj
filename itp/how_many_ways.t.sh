#!/usr/bin/env bash

$1 $2 <<-EOF
5 9
0 0
EOF
echo ------

$1 $2 <<-EOF
3 0
3 1
3 3
0 0
EOF
echo ------

$1 $2 <<-EOF
100 20
0 0
EOF
echo ------
