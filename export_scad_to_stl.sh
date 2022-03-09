#!/bin/bash
set -eu
(
    cd scad
    for file in *.scad; do
        echo "===> export $file to stl"
        openscad -o "${file%.scad}.stl" "$file"
    done
)
