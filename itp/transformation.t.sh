#!/usr/bin/env bash

$1 $2 <<-EOF
abcde
1
print 0 3
EOF
echo ------

$1 $2 <<-EOF
abcde
2
reverse 0 3
print 0 4
EOF
echo ------

$1 $2 <<-EOF
abcde
2
replace 0 2 xyz
print 0 4
EOF
echo ------

$1 $2 <<-EOF
abcde
2
reverse 3 4
print 0 4
EOF
echo ------

$1 $2 <<-EOF
abcde
2
replace 3 4 xy
print 0 4
EOF
echo ------

$1 $2 <<-EOF
abcde
3
replace 1 3 xyz
reverse 0 2
print 1 4
EOF
echo ------

$1 $2 <<-EOF
xyz
3
print 0 2
replace 0 2 abc
print 0 2
EOF
echo ------
