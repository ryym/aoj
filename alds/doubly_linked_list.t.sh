#!/usr/bin/env bash

$1 $2 <<-EOF
0
EOF
echo ------

$1 $2 <<-EOF
3
insert 1
insert 2
insert 3
EOF
echo ------

$1 $2 <<-EOF
5
insert 1
insert 2
insert 3
delete 2
delete 3
EOF
echo ------

$1 $2 <<-EOF
5
insert 1
insert 2
insert 3
deleteFirst
deleteLast
EOF
echo ------

$1 $2 <<-EOF
7
insert 5
insert 2
insert 3
insert 1
delete 3
insert 6
delete 5
EOF
echo ------

$1 $2 <<-EOF
9
insert 5
insert 2
insert 3
insert 1
delete 3
insert 6
delete 5
deleteFirst
deleteLast
EOF
echo ------

$1 $2 <<-EOF
39
insert 1
insert 2
insert 1
insert 1
insert 1
insert 2
insert 2
insert 1
delete 2
deleteLast
deleteFirst
insert 2
insert 2
insert 2
insert 2
insert 2
insert 2
insert 2
insert 2
insert 2
insert 2
deleteFirst
deleteFirst
delete 2
delete 2
deleteFirst
delete 1
insert 3
insert 1
insert 1
delete 2
delete 2
delete 2
deleteLast
insert 4
delete 2
deleteLast
deleteFirst
delete 2
EOF
echo ------

