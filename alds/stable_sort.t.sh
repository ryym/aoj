#!/usr/bin/env bash

$1 $2 <<-EOF
5
H4 C9 S4 D2 C3
EOF
echo ------

$1 $2 <<-EOF
2
S1 H1
EOF
echo ------
