#!/bin/bash

# Print the jot function to the jotrc file.
JOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
JOTRC=$JOT_DIR/jotrc
cat $JOT_DIR/jot > $JOTRC
echo "" >> $JOTRC
echo "# Environment variables." >> $JOTRC
echo "JOT_DIR=$JOT_DIR" >> $JOTRC

# Get users favorite editor and write to settings cfg.
read -p "Favorite terminal text editor [micro]: " editor
JOT_EDITOR=${editor:-micro}
echo "Specified editor: $JOT_EDITOR"
echo "JOT_EDITOR=$JOT_EDITOR" >> $JOTRC

# Specify where to save the notes.
DEF_REPO=git@github.com:nate-h/jots.git
read -p "Your private notes editor repo [$DEF_REPO]: " repo
NOTES_REPO=${repo:-$DEF_REPO}
echo "Specified notes repo: $NOTES_REPO"
echo "NOTES_REPO=$NOTES_REPO" >> $JOTRC

# Create jots dir.
JOTS_DIR=$JOT_DIR/jots
echo "JOTS_DIR=$JOTS_DIR" >> $JOTRC

# Initialize submodule.
if [ ! -d "$JOTS_DIR" ]; then
    echo "Initializing submodule..."
    git clone $NOTES_REPO jots
else
    echo "Submodule already exists. Not recreating."
fi