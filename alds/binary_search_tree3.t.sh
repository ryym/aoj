#!/usr/bin/env bash

# $1 $2 <<-EOF
# 4
# insert 1
# insert 2
# insert 3
# print
# EOF
# echo ------

# $1 $2 <<-EOF
# 10
# insert 10
# insert 5
# insert 2
# print
# insert 6
# print
# insert 8
# insert 1
# insert 22
# print
# EOF
# echo ------

# $1 $2 <<-EOF
# 4
# find 1
# insert 1
# find 1
# print
# EOF
# echo ------

# $1 $2 <<-EOF
# 7
# insert -20
# insert -51
# insert -8
# find -8
# find -9
# find -20
# print
# EOF
# echo ------

# $1 $2 <<-EOF
# 10
# insert 30
# insert 88
# insert 12
# insert 1
# insert 20
# find 12
# insert 17
# insert 25
# find 16
# print
# EOF
# echo ------

# $1 $2 <<-EOF
# 5
# insert -2000000000
# insert 2000000000
# find -2000000000
# find 2000000000
# print
# EOF
# echo ------

$1 $2 <<-EOF
18
insert 8
insert 2
insert 3
insert 7
insert 22
insert 1
find 1
find 2
find 3
find 4
find 5
find 6
find 7
find 8
print
delete 3
delete 7
print
EOF
echo ------

$1 $2 <<-EOF
8
insert 6
insert 2
insert 8
insert 5
insert 7
print
delete 6
print
EOF
echo ------

$1 $2 <<-EOF
11
insert 1000
insert 600
insert 20
insert 800
insert 50
insert 700
insert 690
insert 710
print
delete 600
print
EOF
echo ------

$1 $2 <<-EOF
11
insert 1000
insert 600
insert 20
insert 800
insert 50
insert 70
insert 69
insert 81
print
delete 600
print
EOF
echo ------

