#!/usr/bin/env bash

$1 $2 <<-EOF
2
EOF
echo ------

$1 $2 <<-EOF
3
EOF
echo ------
