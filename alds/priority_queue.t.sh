#!/usr/bin/env bash

$1 $2 <<-EOF
insert 5
extract
end
EOF
echo ------

$1 $2 <<-EOF
insert 5
insert 10
insert 30
insert 2
extract
end
EOF
echo ------

$1 $2 <<-EOF
insert 8
insert 2
extract
insert 10
extract
insert 11
extract
extract
end
EOF
echo ------
