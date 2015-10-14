#!/usr/bin/env bash

$1 $2 <<-EOF
1
EOF
echo ------

$1 $2 <<-EOF
3
EOF
echo ------

$1 $2 <<-EOF
8
EOF
echo ------

$1 $2 <<-EOF
200
EOF
echo ------
