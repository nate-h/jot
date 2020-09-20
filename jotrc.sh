#!/bin/bash

#function to keep track of documents
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $DIR

exit 0

jot()
{
	echo editing $1                                      &&
	git -C $DIR/jot_notes pull -q                        &&
	vim $1                                               &&
	git -C $DIR/jot_notes add $1                         &&
	git -C $DIR/jot_notes commit -m "updated ${1}" -q    &&
	git -C $DIR/jot_notes push origin master -q
}

# loop through array of files
for file in "${files[@]}"
do
	alias "$file"="editFile ${dir}${file}.md"
done
