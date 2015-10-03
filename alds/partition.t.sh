#!/usr/bin/env bash

$1 $2 <<-EOF
5
1 2 3 4 5
EOF
echo ------

$1 $2 <<-EOF
5
5 4 3 2 1
EOF
echo ------

$1 $2 <<-EOF
1
1
EOF
echo ------

$1 $2 <<-EOF
5
3 3 3 3 3
EOF
echo ------

$1 $2 <<-EOF
7
5 4 7 3 8 1 4
EOF
echo ------

$1 $2 <<-EOF
2
2 1
EOF
echo ------

$1 $2 <<-EOF
12
13 19 9 5 12 8 7 4 21 2 6 11
EOF
echo ------
