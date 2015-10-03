#!/usr/bin/env bash

$1 $2 <<-EOF
6
5
3
1
3
4
3
EOF
echo ------

$1 $2 <<-EOF
3
4
3
2
EOF
echo ------

$1 $2 <<-EOF
2
0
0
EOF
echo ------

$1 $2 <<-EOF
4
5
100
1
3
EOF
echo ------

$1 $2 <<-EOF
2
1
1000000000
EOF
echo ------

$1 $2 <<-EOF
2
1000000000
1
EOF
echo ------

$1 $2 <<-EOF
2
1000000000
1000000000
EOF
echo ------

$1 $2 <<-EOF
2
1
1
EOF
echo ------
