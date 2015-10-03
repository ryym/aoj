#!/usr/bin/env bash

$1 $2 <<-EOF
abcdefghijklmnopqrstuvwxyz.
ABCDEFGHIJKLMNOPQRSTUVWXYZ.
EOF
echo ------

$1 $2 <<-EOF
This is a pen.
What is this?
EOF
echo ------
