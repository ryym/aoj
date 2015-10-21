#!/usr/bin/env bash

$1 $2 <<-EOF
5 14 80
EOF
echo ------

$1 $2 <<-EOF
10 10 10
EOF
echo ------

$1 $2 <<-EOF
1 10000 2000
EOF
echo ------
