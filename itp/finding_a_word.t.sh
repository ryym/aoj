#!/usr/bin/env bash

$1 $2 <<-EOF
test
test test test
END_OF_TEXT
EOF
echo ------

$1 $2 <<-EOF
computer
Nurtures computer scientists and highly-skilled computer engineers
who will create and exploit "knowledge" for the new era.
Provides an outstanding computer environment.
END_OF_TEXT
EOF
echo ------

$1 $2 <<-EOF
computer
I am a hero!
END_OF_TEXT
EOF
echo ------

$1 $2 <<-EOF
computer
END_OF_TEXT
EOF
echo ------

$1 $2 <<-EOF
aizu
Aizu x aizu AIZU aIzu aiZu a
a i z u aiz a izu
END_OF_TEXT
EOF
echo ------
