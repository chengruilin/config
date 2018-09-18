#!/bin/bash

echo "Ryan's config installing..."

current_path=`pwd`
file_spacemacs="$HOME/.spacemacs"
file_bak_spacemacs="$HOME/_spacemacs.bak1024"

file_layers="$HOME/.emacs.d/private/layers"

file_snippets="$HOME/.emacs.d/private/snippets"
file_bak_snippets="$HOME/.emacs.d/private/snippets.bak1024"



echo "$current_path"
echo $file_bak_spacemacs

echo " "
echo "------------------ spacemacs ------------------"

#if [ -h "$file_bak_spacemacs" ]; then
#    echo "bak file exists, delete it"
#    `rm ${file_bak_spacemacs}`
#fi

#file_spacemacs="$HOME/_spacemacs"

if [ -f "$file_spacemacs" ] && [ ! -h "$file_spacemacs" ]; then
    read -r -p "File .spaceamcs exits, backup it (defualt is _spacemacs.bak1024) ? " check_bak_spacemacs

    if [ ! -n "$check_bak_spacemacs" ]; then
        check_bak_spacemacs="$file_bak_spacemacs"
    else
        check_bak_spacemacs="$HOME/$check_bak_spacemacs"
    fi

    `mv ${file_spacemacs} ${check_bak_spacemacs}`
else
    echo "$file_spacemacs file not exists."
fi

echo "Link spacemacs file to $file_spacemacs"
`ln -sf ${current_path}/.spacemacs ${file_spacemacs}`

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

if [ -d "$file_snippets" ] && [ ! -h "$file_snippets" ]; then
    echo "Copy origin snippts directory to snippts.bak1024"
    `mv ${file_snippets} ${file_bak_snippets}`
else
    echo "snippets directory not exists."
fi

echo " "
echo "------------------ Org-Files ------------------"
echo "Link custom snippts to ~/.emacs.d/snippets"
`ln -sf ${current_path}/snippets/ ${file_snippets}`

#-------------- Git Clone org files --------------
org_clone_path="$HOME/org"
cloneOrgFiles() {
    if command -v git >/dev/null 2>&1; then
        if [ ! -d "$org_clone_path" ]; then
            echo 'clone org files to ~/org'
            `git clone git@github.com:chengruilin/org.git $org_clone_path`
        fi
    else
        echo 'no exists git'
    fi
}

read -r -p "Need clone org files? [y/N] " response
response=${response:="Y"}
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    cloneOrgFiles
else
    echo "Finish"
fi
