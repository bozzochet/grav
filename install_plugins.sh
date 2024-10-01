#!/bin/bash -l

# this tries to upgrade the grav version itself, that maybe is better to avoid
#bin/gpm selfupgrade -f

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

bin/gpm install -y youtube

# custom plugins
if [ ! -e user/plugins/aboutme/ ]
then
    cd user/plugins/
    git clone git@github.com:bozzochet/grav-plugin-about-me.git
    mv -v grav-plugin-about-me aboutme
    cd -
fi
./composer.phar update

bin/gpm update -y
