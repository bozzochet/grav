#!/bin/bash -l

bin/gpm selfupgrade -f

#this on the final server should be removed
#bin/gpm install -y admin
# if put here, even if then removed, seems that the remove is not working once you first login via admin and then send another `#bin/gpm remove -y admin`

bin/gpm install -y bibtexify

bin/gpm install -y consistent-backup-name

bin/gpm install -y pdf-js

bin/gpm install -y devtools

bin/gpm install -y page-inject

bin/gpm install -y cookieconsent

bin/gpm install -y github

bin/gpm update -y
