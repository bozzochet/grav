#!/bin/bash

# quando non funziona il plugin:
# - ci sono accenti non messi in latex
# - c'è il campo "correspondance_address"

#SHORTEN_AUTHORS=0
SHORTEN_AUTHORS=1

echo "---" > text.md
echo "title: Publications" >> text.md
echo "body_classes: modular" >> text.md
echo "features:" >> text.md
echo "visible: false" >> text.md
echo "markdown:" >> text.md
echo "  auto_url_links: false" >> text.md
echo "---" >> text.md
echo "" >> text.md
echo "[bibtexify hideMissing=true]" >> text.md
echo "" >> text.md

if [[ "$SHORTEN_AUTHORS" == "1" ]]
then
    export IFS=$'\n'
    for i in `cat ~/Documents/Archivio/Curriculum/pubblicazioni.bib`
    do
	if [[ "$i" =~ "author"* ]]
	then
	    AUTHORS=$i
	    FIRSTAUTHOR=`echo $AUTHORS | awk 'BEGIN { FS=" and " } { print $1 }'`
	    if [[ "$FIRSTAUTHOR" == "$AUTHORS" ]]
	    then
		echo "$AUTHORS" >> text.md
	    elif [[ "$FIRSTAUTHOR" == *"Duranti"* ]]
	    then
		echo "$FIRSTAUTHOR and {et al.}}," >> text.md
	    else
		echo "$FIRSTAUTHOR and {...} and {M. Duranti} and {et al.}}," >> text.md
	    fi
	elif [[ "$i" == @* ]]
	then
	    echo "" >> text.md
	    echo "$i" >> text.md
	else
	    echo "$i" >> text.md
	fi
    done
else
    cat ~/Documents/Archivio/Curriculum/pubblicazioni.bib >> text.md
fi

echo "" >> text.md
echo "[/bibtexify]" >> text.md

mv -v text.md user/pages/02.publications/02._publications/
