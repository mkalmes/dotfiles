#!/bin/sh

# simple deploy script
# inspired by https://github.com/cypher/dotfiles/

# Deploy files
for file in `find ${PWD} -maxdepth 1 -not -name '.*' -not -name deploy.sh -not -name README.md -type f`; do
    filename=`basename "$file"`
    echo "ln -nfs `pwd`/$filename -> ~/.$filename"
    ln -nfs `pwd`/$filename ~/.$filename
done

# Deploy folders
for dir in `find ${PWD}/. -maxdepth 1 -not -name '.*' -type d`; do
    dirname=`basename "$dir"`
    echo "ln -nfs `pwd`/$dirname -> ~/.$dirname"
    ln -nfs `pwd`/$dirname ~/.$dirname
done
