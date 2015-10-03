#!/usr/bin/env bash

$1 $2 <<-EOF
2
insert AAA
find A
EOF
echo ------

$1 $2 <<-EOF
7
insert A
insert T
insert C
insert C
insert A
find G
find A
EOF
echo ------

$1 $2 <<-EOF
13
insert AAA
insert AAC
insert AGA
insert AGG
insert TTT
find AAA
find CCC
find CCC
insert CCC
find CCC
insert T
find TTT
find T
EOF
echo ------

$1 $2 <<-EOF
5
insert AAGC
find AAGC
find AACG
find ACGA
find TGCC
EOF
echo ------

$1 $2 <<-EOF
4
insert AAAAAAAAAAAA
insert AAACCAAGATAA
find AAACCAAGATAA
find AAAAAAAAAAAC
EOF
echo ------

$1 $2 <<-EOF
15
insert AAA
insert AAC
insert AGA
insert AGG
insert TTT
find AAA
find CCC
find CCC
insert CCC
find CCC
find CC
insert T
find TTT
find T
find A
EOF
echo ------

$1 $2 <<-EOF
9
insert A
insert TTTTTTTTTTTT
find A
find TTTTTTTTTTTT
find AAA
find TTTTTTTTT
find TTT
insert ACGTACGTACGT
find ACGTACGTACGT
EOF
echo ------
