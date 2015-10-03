#!/usr/bin/env bash

$1 $2 <<-EOF
4 3 90
EOF
echo ------

$1 $2 <<-EOF
8 5 70
EOF
echo ------
