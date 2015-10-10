#!/usr/bin/env bash

$1 $2 <<-EOF
2
insert 1
print
EOF
echo ------

$1 $2 <<-EOF
4
insert 1
insert 2
insert 3
print
EOF
echo ------

$1 $2 <<-EOF
10
insert 10
insert 5
insert 2
print
insert 6
print
insert 8
insert 1
insert 22
print
EOF
echo ------

$1 $2 <<-EOF
8
insert 30
insert 88
insert 12
insert 1
insert 20
insert 17
insert 25
print
EOF
echo ------

$1 $2 <<-EOF
16
insert 20
insert 19
insert 2000000000
print
insert 61
insert -51
insert 18
insert 5
insert 3
insert 7
insert 30
insert 25
insert 40
insert 41
insert 42
print
EOF
echo ------
