#!/usr/bin/env bash

$1 $2 <<-EOF
abcdef
1
2
-
EOF
echo ------

$1 $2 <<-EOF
aabc
3
1
2
1
vwxyz
2
3
4
-
EOF
echo ------

$1 $2 <<-EOF
aabc
0
-
EOF
echo ------

$1 $2 <<-EOF
abc
3
3
3
3
-
EOF
echo ------

$1 $2 <<-EOF
abc
2
1
1
-
EOF
echo ------
