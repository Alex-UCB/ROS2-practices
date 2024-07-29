#!/bin/bash
for main_dir in */; do
    echo " Directory $main_dir is being checked"
    if [ -d "$main_dir" ] && [ "$(ls -A "$main_dir")" ]; then
        for dir in "$main_dir"/*; do
            echo " Second level directory $dir is being checked"
            if [ -d "$dir" ]; then
                for subdir in "$dir"/*; do
                    echo " subdir $subdir is being checked"
                    if [ -d "$subdir" ]; then
                        if [ ! -f "$subdir/package.xml" ]; then
                            echo "    Subdirectory $subdir is missing required files."
                            exit 1
                        fi
                    fi
                done
            fi
        done
    else
        echo "    Directory $main_dir is empty and will be skipped."
    fi
done

