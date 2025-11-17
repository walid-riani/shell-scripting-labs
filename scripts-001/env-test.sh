#!/usr/bin/env bash

echo "===== TEST 1 - Global variable ====="
x="global-value"

bash -c 'echo "Child sees x = [$x]"'

echo
echo "===== TEST 2 - Environment variable (export) ====="
export y="environment-value"

bash -c 'echo "Child sees y = [$y]"'

echo
echo "===== TEST 3 - Local variable inside a function ====="
my_func() {
    local z="local-value"
    bash -c 'echo "Child inside function sees z = [$z]"'
}

my_func
