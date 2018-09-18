#!/bin/bash

echo "Ryan's config installing..."

current_path=`pwd`
file_spacemacs="~/.spacemacs"
file_bak_spacemacs="~/_spacemacs.bak1024"

file_layers="~/.emacs.d/private/layers"

file_snippets="~/.emacs.d/private/snippets"
file_bak_snippets="~/.emacs.d/private/snippets.bak1024"


echo "$current_path"

echo " "
echo "------------------ spacemacs ------------------"

if [ -L "$file_bak_spacemacs" ]; then
    echo "bak file exists, delete it"
    `rm ${file_bak_spacemacs}`
fi

if [ -f "$file_spacemacs" ]; then
    echo "Copy origin .spacemacs file to _spacemacs.bak1024"
    `mv ${file_spacemacs} ${file_bak_spacemacs}`
else
    echo "$file_spacemacs file not exists."
fi

echo "Link spacemacs file to $file_spacemacs"
`ln -sf ${current_path}/.spacemacs ~/.spacemacs`

echo " "
echo "------------------ layers ------------------"

echo "Link private layer to $file_layers"
`ln -sf ${current_path}/layers/ ${file_layers}`

echo " "
echo "------------------ snippets ------------------"

if [ -L "$file_bak_snippets" ]; then
    echo "bak snippets exists, delete it"
    `rm ${file_bak_snippets}`
else
    echo "$file_bak_snippets not exits"
fi

if [ -d "$file_snippets" ]; then
    echo "Copy origin snippts directory to snippts.bak1024"
    `mv ${file_snippets} ${file_bak_snippets}`
else
    echo "snippets directory not exists."
fi

echo "Link custom snippts to ~/.emacs.d/snippets"
`ln -sf ${current_path}/snippets/ ${file_snippets}`
