#!/bin/bash

PASSED=0 FAILED=0 SHOW=$1

function test_data {
    read DATA
    read EXPECT
    if [[ "$(echo $DATA | ./swap_elem)" != "$EXPECT" ]];
    then
	if [[ ${SHOW:-fail} == fail ]]; then
	    echo "testing : $DATA"
	    echo "expect  : $EXPECT  ... fail"
	    echo
	fi
	FAILED=$(($FAILED + 1))
    else
	if [[ ${SHOW:-pass} == pass ]]; then
	    echo "testing : $DATA"
	    echo "expect  : $EXPECT  ... pass"
	    echo
	fi
	PASSED=$(($PASSED + 1))
    fi
}

# g++ --std=c++11 -o swap_elem SwapElement.cpp

test_data <<EOF
EOF

test_data <<EOF
1
1
EOF

test_data <<EOF
1 2
1 2
EOF

test_data <<EOF
1 2 3
3 2 1
EOF

test_data <<EOF
1 2 3 4
3 4 1 2
EOF

test_data <<EOF
1 2 3 4 5
3 4 1 2 5
EOF

test_data <<EOF
1 2 3 4 5 6
3 4 1 2 5 6
EOF

test_data <<EOF
1 2 3 4 5 6 7
3 4 1 2 7 6 5
EOF

test_data <<EOF
1 2 3 4 5 6 7 8
3 4 1 2 7 8 5 6
EOF

echo SUMMARY: PASSED=$PASSED, FAILED=$FAILED
