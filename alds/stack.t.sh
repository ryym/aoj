#!/usr/bin/env bash

$1 $2 <<-EOF
1 2 +
EOF
echo ------

$1 $2 <<-EOF
1 2 + 3 4 - *
EOF
echo ------

$1 $2 <<-EOF
40 18 + 21 -
EOF
echo ------

$1 $2 <<-EOF
104000 30 20 10 * - +
EOF
echo ------
