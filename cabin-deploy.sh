#!/bin/bash

# cabin-deploy.sh: generate blog files and deploy to server

# Take contents of the source and copy it to destination
# Turn markdown into html in the process and create indexes
# At the end send everything to the server

if [ "$#" -ne 2 ]; then
        echo "Error: Invalid number of arguments"
        echo "Usage: $0 source destination"
        exit 1
fi

src="$(realpath $1)"
dst="$(realpath $2)"

# copy all of the files from source to desination
# excluding md files and .git subdirectory
pushd "$src" || exit
find . -not -iname "*.md" -a -not -path "*.git*" | cpio -pd "$dst" 2>/dev/null
popd || exit

opt=()
opt+=(--author "Dimitrije Dobrota")
opt+=(--base "https://dimitrijedobrota.com")
opt+=(--email "mail@dimitrijedobrota.com")
opt+=(--desc "Contents of Dimitrije Dobrota's blog")
opt+=(--summary "Click on the article link to read...")

# Convert all the md files to articles
# Create all the indexes
stamd "${opt[@]}" --output "$dst/blog" --index $src/blog/*.md

# Create a home page
stamd "${opt[@]}" --output "$dst" $src/*.md

# Copy everything to the server
rsync -a $dst/* server:/var/www/cabin
