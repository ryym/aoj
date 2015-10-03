#!/usr/bin/env bash

$1 $2 <<-EOF
6
D 3
H 2
D 1
S 3
D 2
C 1
EOF
echo ------

$1 $2 <<-EOF
6
D 6
H 5
D 4
S 3
D 2
C 1
EOF
echo ------

$1 $2 <<-EOF
2
S 1
H 1
EOF
echo ------
