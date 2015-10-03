#!/usr/bin/env bash

$1 $2 <<-EOF
5 4 2 2 1
EOF
echo ------

$1 $2 <<-EOF
5 4 2 4 1
EOF
echo ------

$1 $2 <<-EOF
2 2 1 1 1
EOF
echo ------

$1 $2 <<-EOF
1 1 1 1 0
EOF
echo ------

$1 $2 <<-EOF
1 2 0 0 1
EOF
echo ------

$1 $2 <<-EOF
10 12 -1 -2 100
EOF
echo ------

$1 $2 <<-EOF
5 5 4 4 1
EOF
echo ------

$1 $2 <<-EOF
5 5 4 4 2
EOF
echo ------

$1 $2 <<-EOF
5 4 1 1 1
EOF
echo ------

$1 $2 <<-EOF
5 4 1 1 2
EOF
echo ------
