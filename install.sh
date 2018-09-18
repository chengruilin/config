#!/bin/bash

echo "Ryan's config installing..."

current_path=`pwd`

echo $current_path

echo "Copy origin .spacemacs file to _spacemacs.bak1024"
`mv ~/.spacemacs ~/_spacemacs.bak1024`

echo "Link spacemacs file to ~/.spacemacs"
`ln -s ${current_path}/.spacemacs ~/.spacemacs`

echo "Link private layer to ~/.emacs.d/private/layers"
`ln -s ${current_path}/layers ~/.emacs.d/private/layers`

echo "Copy origin snippts directory to snippts.bak1024"
`mv ~/.emacs.d/private/snippts/ ~/.emacs.d/private/snippts.bak1024`

echo "Link custom snippts to ~/.emacs.d/snippets"
`ln -s ${current_path}/snippets ~/.emacs.d/private/snippets`

