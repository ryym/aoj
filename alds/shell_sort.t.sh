#!/usr/bin/env bash

$1 $2 <<-EOF
5
5
1
4
3
2
EOF
echo ------

$1 $2 <<-EOF
3
3
2
1
EOF
echo ------
