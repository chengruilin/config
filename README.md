# Personal Config Files

## install

``` shell
chmod +x install.sh
./install.sh
```

## Spacemacs config

``` shell
pwd
ln -s 'pwd'/.spacemacs ~/.spacemacs
```

### private layer
link private layer to "~/.emacs.d/private/layers"

``` shell
pwd
ln -s 'pwd'/layers ~/.emacs.d/private/layers
```

### vue support
install vue-language-server

``` shell
# with npm
npm install vue-language-server -g
```

### yasnippt

link yasnippts to "~/.emacs.d dir"
``` shell
pwd
ln -s 'pwd'/snippts/ ~/.emacs.d/private/snippts/
```


``` shell
## buffer
yas-new-snippt

```

## zshrc

``` shell
plugins=(
  git
  // shell auto-complete
  zsh-autosuggestions
)

```


