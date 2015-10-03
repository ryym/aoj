#!/usr/bin/env bash

$1 $2 <<-EOF
0 0 1 1
EOF
echo ------

$1 $2 <<-EOF
2 2 5 5
EOF
echo ------

$1 $2 <<-EOF
1 3 2 12
EOF
echo ------
