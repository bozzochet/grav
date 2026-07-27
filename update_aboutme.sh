#!/bin/bash -l

rm -Rf user/plugins/aboutme
if [ ! -e user/plugins/aboutme/ ]
then
    cd user/plugins/
    git clone git@github.com:bozzochet/grav-plugin-about-me.git
    mv -v grav-plugin-about-me aboutme
    cd -
fi

./composer.phar update

bin/gpm update -y
