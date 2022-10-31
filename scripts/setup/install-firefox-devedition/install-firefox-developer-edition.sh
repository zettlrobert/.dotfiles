#!/bin/bash
#
# Download via official Firefox Link, this link is taken from the offical website and could change: https://www.mozilla.org/en-US/firefox/developer/
until (wget -O FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64"); do sleep 1; done;
tar xvf FirefoxSetup.tar.bz2
sudo -S mv firefox /opt/firefox-devedition

outputpath='/usr/local/share/applications/FirefoxDeveloperEdition.desktop'

DIR="${BASH_SOURCE%/*}" # should be .
command="cp FirefoxDeveloperEdition.desktop $outputpath"

sudo -S cp ./FirefoxDeveloperEdition.desktop $outputpath

sudo -S rm -r FirefoxSetup.tar.bz2

