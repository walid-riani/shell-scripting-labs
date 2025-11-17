#!/usr/bin/env bash

x="global"

make_local() {
    local x="local"
    echo "Inside function: $x"
}

make_global() {
    x="modified-global"
    echo "Inside function: $x"
}

echo "Before local: $x"
make_local
echo "After local:  $x"

echo

echo "Before global: $x"
make_global
echo "After global:  $x"