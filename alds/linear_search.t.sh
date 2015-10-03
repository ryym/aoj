#!/usr/bin/env bash

$1 $2 <<-EOF
5
1 2 3 4 5
3
3 4 1
EOF
echo ------

$1 $2 <<-EOF
3
1 2 3
3
1 2 3
EOF
echo ------

$1 $2 <<-EOF
3
3 1 2
1
5
EOF
echo ------

$1 $2 <<-EOF
2
91 41
5
1 41 3 3 2
EOF
echo ------
