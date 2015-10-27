#!/usr/bin/env bash

$1 $2 <<-EOF
abcdef
abc
EOF
echo ------

$1 $2 <<-EOF
abcdef
fab
EOF
echo ------

$1 $2 <<-EOF
abcdef
faz
EOF
echo ------

$1 $2 <<-EOF
vanceknowledgetoad
advance
EOF
echo ------
