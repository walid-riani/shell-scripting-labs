#!/usr/bin/env bash

echo "== Test 1: Local variable in main script =="

x="main-value"     # gewone (global) variabele in script

show_x() {
    echo "Inside function: x = $x"
}

show_x  # zou main-value moeten laten zien

echo

echo "== Test 2: Local inside function =="

y="start-value"

make_local_y() {
    local y="local-value"
    echo "Inside function: y = $y"
}

make_local_y    # verwacht: local-value
echo "Outside function: y = $y"   # verwacht: start-value

echo

echo "== Test 3: Function modifies global =="

z="before"

modify_global() {
    z="after"
}

echo "Before function: z = $z"
modify_global
echo "After function:  z = $z"
