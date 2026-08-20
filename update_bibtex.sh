#!/bin/bash

# quando non funziona il plugin:
# - ci sono accenti non messi in latex
# - c'è il campo "correspondance_address" --> non sono più sicuro
# - parentesi {} a caso, tipo su Mori, title a journal, ma non per fare caratteri greci, etc...:
# @article{bib:HERDcomputing,
#        author = {{Mori}, N. and Ciangottini, D. and Duranti, M. and Formato, V. and Spiga, D.},
#        date-added = {2026-05-18 15:28:14 +0200},
#        date-modified = {2026-05-18 15:28:37 +0200},
#        doi = {https://doi.org/10.1088/1742-6596/3206/1/012008},
#        journal = {{J. Phys. Conf. Ser.}},
#        number = {1},
#        pages = {012008},
#        title = {{A cloud-based computing infrastructure for the HERD cosmic-ray experiment}},
#        volume = {3206},
#        year = {2026},
#        url = {https://iopscience.iop.org/article/10.1088/1742-6596/3206/1/012008},
#        bdsk-url-1 = {https://doi.org/10.1088/1742-6596/3206/1/012008}}

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
