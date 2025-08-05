#!/usr/bin/env bash
pushd ~/code > /dev/null

# find all folders that have a git directory
fd -t d -u -I \
    -E node_modules \
    -E vendor \
    -E zsh \
    --no-ignore-vcs '^.git$' | xargs -I{} echo "{}" | sed -re 's|.git/||g'
