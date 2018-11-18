#!/bin/bash

PASSED=0 FAILED=0 SHOW=$1

function test_data {
    read DATA
    read EXPECT
    DATA=($DATA)
    if [[ "$(echo ${#DATA[@]} ${DATA[@]} | ./not_three)" -ne "$EXPECT" ]];
    then
	if [[ ${SHOW:-fail} == fail ]]; then
	    echo "testing : ${DATA[@]}"
	    echo "expect  : $EXPECT  ... fail"
	    echo
	fi
	FAILED=$(($FAILED + 1))
    else
	if [[ ${SHOW:-pass} == pass ]]; then
	    echo "testing : ${DATA[@]}"
	    echo "expect  : $EXPECT  ... pass"
	    echo
	fi
	PASSED=$(($PASSED + 1))
    fi
}

# g++ -o not_three NotThree.cpp

test_data <<EOF
1 1 1 2 2 2 3 3 4 4 4 5 5 5
3
EOF

test_data <<EOF
4 4 4 5 5 5 6 6 6 7 8 8 8
7
EOF

test_data <<EOF
EOF

test_data <<EOF
4
4
EOF

test_data <<EOF
4 4
4
EOF

test_data <<EOF
4 4 4

EOF

test_data <<EOF
4 4 4 4
4
EOF

test_data <<EOF
4 4 4 4 4
4
EOF

test_data <<EOF
4 4 4 4 4 4

EOF

test_data <<EOF
5 3 3 3
5
EOF

test_data <<EOF
5 5 3 3 3
5
EOF

test_data <<EOF
5 5 5 3 3 3

EOF

test_data <<EOF
5 5 5 3 3 3 3
3
EOF

test_data <<EOF
5 5 5 3 3 3 3 3
3
EOF

test_data <<EOF
5 5 5 3 3 3 3 3 3

EOF

test_data <<EOF
5 5 5 3 3 3 2
2
EOF

echo SUMMARY: PASSED=$PASSED, FAILED=$FAILED
