#!/usr/bin/env bash

$1 $2 <<-EOF
abcde
EOF
echo ------

$1 $2 <<-EOF
ABCDE
EOF
echo ------

$1 $2 <<-EOF
fAIR, LATER, OCCASIONALLY CLOUDY.
EOF
echo ------

$1 $2 <<-EOF
.,;:+*!"#$%&'()[]{}^/_ABCdef
EOF
echo ------

$1 $2 <<-EOF
0123456789WXyz
EOF
echo ------
