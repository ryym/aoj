#!/usr/bin/env bash

$1 $2 <<-EOF
2
1 1 2
2 1 1
EOF
echo ------

$1 $2 <<-EOF
4
1 2 2 4
2 1 4
3 0
4 1 3
EOF
echo ------
