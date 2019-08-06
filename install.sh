#!/usr/bin/env bash

echo "Chengrui's config installing..."

CURRENT_PATH=`pwd`
OS_NAME=`uname -s`

ORG_PATH="$HOME/.chr-org"
SPACEMACS_BAK="$HOME/_spacemacs.bak1024"
SPACEMACS_FILE="$HOME/.spacemacs"

#------- Install Git ----------

if [ $OS_NAME == "Darwin" ]; then
    echo 'Mac has git installed'
elif [ $OS_NAME == "Linux" ]; then
    if command -v git >/dev/null 2>$1; then
        echo 'git has installed.'
    elif command -v yum >/dev/null 2>$1; then
        echo 'Install git with yum'
        `sudo yum install git`
    elif command -v apt-get >/dev/null 2>$1; then
        echo 'Install git with apt-get'
        `sudo apt-get install git`
    else
        echo 'Cannot install git auto'
    fi
fi

#-------------- Install Spacemacs --------------
_createSpacemacsFile() {
    if [ -f "$SPACEMACS_FILE" ] && [ ! -h "$SPACEMACS_FILE" ]; then
        read -r -p "File .spaceamcs exits, backup it (defualt is _spacemacs.bak1024) ? " space_backup
        if [ ! -n "$space_backup" ]; then
            space_backup="$SPACEMACS_BAK"
        else
            space_backup="$HOME/$space_backup"
        fi
        `mv ${SPACEMACS_FILE} ${space_backup}`
    else
        echo "$file_spacemacs file not exists."
    fi

    if [ ! -h "$SPACEMACS_FILE" ]; then
        echo "Link spacemacs file to $file_spacemacs"
        `ln -s ${CURRENT_PATH}/spacemacs ${SPACEMACS_FILE}`
    fi
}

_npmInstallSpaceSupport() {
    if command -v npm >/dev/null 2>$1; then
        echo 'install ternJS'
        `npm install -g tern`
        echo 'install js-beautify'
        `npm install -g js-beautify`
        echo 'install eslint'
        `npm install -g eslint`
        echo 'install jshint'
        `npm install -g jshint`
    else
        echo 'You must install node first.'
    fi
}

_installWakatime() {
    if command -v wakatime >/dev/null 2>$1; then
        echo 'You can install wakatime use command:[sudo pip install wakatime]'
    fi
}

read -r -p "Install spacemacs? [y/N]" space_y_n
space_y_n=${space_y_n:="Y"}
if [[ "$space_y_n" =~ ^([yY][eE][sS]|[yY])+$ ]]; then

    `git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d`

    echo 'Create .spacemacs file:'
    _createSpacemacsFile

    echo 'Install npm support:'
    _npmInstallSpaceSupport

    echo 'Install wakatime:'
    _installWakatime
fi

#-------------- Install nvm --------------
if command -v nvm >/dev/null 2>$1; then
    #ignore
else
    read -r -p "Install spacemacs? [y/N]" nvm_y_n
    nvm_y_n=${nvm_y_n:="Y"}
    if [[ "$nvm_y_n" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
        `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash`
    fi
fi
read -r -p "Input default node version (default: 8.11.1):" node_version
node_version=${node_version:="8.11.1"}
if [[ ! -z "$node_version" ]]; then
    `nvm install $node_version`
    `nvm use $node_version`
    `nvm alias default $node_version`
fi



#-------------- Git Clone org files --------------
read -r -p "Need clone org files? [y/N] " org_y_n
org_y_n=${org_y_n:="Y"}
if [[ "$org_y_n" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    if command -v git >/dev/null 2>&1; then
        if [ ! -d "$org_clone_path" ]; then
            echo 'clone org files to ~/.chr-org'
            `git clone git@github.com:chengruilin/org.git $ORG_PATH`
        fi
    fi
fi
