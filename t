#!/usr/bin/env bash

target=$(cat ./.target)
testfile="${target%%.*}.t.sh"
target=${1:-$target}

./$testfile bin/test $target
