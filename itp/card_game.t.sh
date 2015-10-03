#!/usr/bin/env bash

$1 $2 <<-EOF
1
abc zzz
EOF
echo ------

$1 $2 <<-EOF
1
abc abca
EOF
echo ------

$1 $2 <<-EOF
1
abcz abd
EOF
echo ------

$1 $2 <<-EOF
1
abca abca
EOF
echo ------

$1 $2 <<-EOF
1
a a
EOF
echo ------

$1 $2 <<-EOF
3
cat dog
fish fish
lion tiger
EOF
echo ------

$1 $2 <<-EOF
1
z abdeffg
EOF
echo ------
