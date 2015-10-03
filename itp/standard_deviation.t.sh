#!/usr/bin/env bash

$1 $2 <<-EOF
5
70 80 100 90 20
3
80 80 80
0
EOF
echo ------

$1 $2 <<-EOF
5
10 20 30 40 50
0
EOF
echo ------
