#!/usr/bin/env bash

apt install vim tmux mutt isync htop strace lsof cmake git texlive-full nautilus-dropbox graphviz -y


echo "Installing Gnucash..."
apt install build-essential libdbd-sqlite3 pkg-config libglib2.0 m4 automake libtool autoconf libxml2-dev libxslt-dev webkit2gtk-4.0 guile-2.2 guile-2.2-dev gwenhywfar-tools libgwenhywfar-core-dev libaqbanking-dev
cpan install Finance::Quote
