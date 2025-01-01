#!/bin/bash

# cabin-deploy.sh: generate blog files and deploy to server

if [ "$#" -ne 2 ]; then
        echo "Error: Invalid number of arguments"
        echo "Usage: $0 source destination"
        exit 1
fi

src="$(realpath $1)"
dst="$(realpath $2)"

pushd "$src" || exit
find . -not -iname "*.md" -a -not -path "*.git*" -a -not -path "*.git*" | cpio -pd "$dst" 2>/dev/null
popd || exit

opt=()
opt+=(--author "Dimitrije Dobrota")
opt+=(--base "https://dimitrijedobrota.com")
opt+=(--email "mail@dimitrijedobrota.com")
opt+=(--desc "Contents of Dimitrije Dobrota's blog")
opt+=(--summary "Click on the article link to read...")

stamd "${opt[@]}" --output "$dst/blog" --index $src/blog/*.md
stamd --output "$dst" $src/*.md

rsync -a $dst/* server:/var/www/cabin
