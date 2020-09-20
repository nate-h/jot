#!/bin/bash

> settings.cfg
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# Get users favorite editor and write to settings cfg.
read -p "Favorite terminal text editor [micro]: " editor
JOT_EDITOR=${name:-micro}
echo "Specified editor: $JOT_EDITOR"
echo "JOT_EDITOR=$JOT_EDITOR" >> settings.cfg

# Specify where to save the notes.
DEF_REPO=git@github.com:nate-h/jots.git
read -p "Your private notes editor repo [$DEF_REPO]: " repo
NOTES_REPO=${repo:-$DEF_REPO}
echo "Specified notes repo: $NOTES_REPO"
echo "NOTES_REPO=$NOTES_REPO" >> settings.cfg

# Initialize submodule.
if [ ! -d "$DIR/jots" ]; then
    echo "Initializing submodule..."
    git clone $NOTES_REPO jots
else
    echo "Submodule already exists. Not recreating."
fi