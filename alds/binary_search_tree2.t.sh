#!/usr/bin/env bash

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
4
find 1
insert 1
find 1
print
EOF
echo ------

$1 $2 <<-EOF
7
insert -20
insert -51
insert -8
find -8
find -9
find -20
print
EOF
echo ------

$1 $2 <<-EOF
10
insert 30
insert 88
insert 12
insert 1
insert 20
find 12
insert 17
insert 25
find 16
print
EOF
echo ------

$1 $2 <<-EOF
5
insert -2000000000
insert 2000000000
find -2000000000
find 2000000000
print
EOF
echo ------

