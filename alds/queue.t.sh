#!/usr/bin/env bash

$1 $2 <<-EOF
3 100
p1 100
p2 100
p3 100
EOF
echo ------

$1 $2 <<-EOF
5 100
p1 150
p2 80
p3 200
p4 350
p5 20
EOF
echo ------

$1 $2 <<-EOF
3 2
p1 8
p2 5
p3 4
EOF
echo ------

$1 $2 <<-EOF
2 8000
ga@a@w09urer22 408000
ga@a@w09urer 302000
EOF
echo ------

$1 $2 <<-EOF
2 1000
a 1001
b 2
EOF
echo ------
