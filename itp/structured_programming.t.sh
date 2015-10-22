#!/usr/bin/env bash

$1 $2 <<-EOF
30
EOF
echo ------

$1 $2 <<-EOF
100
EOF
echo ------
