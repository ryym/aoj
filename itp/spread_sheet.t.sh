#!/usr/bin/env bash

$1 $2 <<-EOF
4 5
1 1 3 4 5
2 2 2 4 5
3 3 0 1 1
2 3 4 4 6
EOF
echo ------

$1 $2 <<-EOF
1 1
1
EOF
echo ------

$1 $2 <<-EOF
3 3
2 2 2
2 2 2
2 2 2
EOF
echo ------
