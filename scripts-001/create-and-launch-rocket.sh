#!/bin/bash

# ----------------------------------------
# Script: create-and-launch-rocket.sh
# Purpose: Creates a lunar mission and launches it
# Author: Walid Riani
# ----------------------------------------

MISSION="lunar-mission"

echo "== Creating mission directory =="
mkdir -p "$MISSION"

echo "== Starting rocket sequence for $MISSION =="
rocket-add "$MISSION"
rocket-start-power "$MISSION"
rocket-internal-power "$MISSION"
rocket-start-sequence "$MISSION"
rocket-start-engine "$MISSION"
rocket-lift-off "$MISSION"

echo "== Checking status =="
rocket-status "$MISSION"

echo "== Mission completed 🚀 =="