# Zsh

Install zsh with apt. Install the zshrc with the below command:

``` bash
ln -s ~/dotfiles/zshrc ~/.zshrc
```

Note that the zshrc assumes that the repository is located in ~/dotfiles

# Emacs

Install the latest emacs. I usually install from source to get the latest version.
Prelude is present, but no longer maintained, so we use doom. To install:

``` bash
ln -s ~/dotfiles/doom.d ~/.doom.d
ln -s ~/dotfiles/doomemacs ~/.emacs.d
```


The doom path is already set up as part of the zshrc setup. Run:

``` bash
doom sync
emacs
```

Once you're in emacs, you'll need to install fonts with `M-x nerd-icons-install-fonts`

## Installing Emacs by source

If you're going to install emacs manually, download it from the emacs mirror. On
Ubuntu 22.04, you need to install a bunch of dependencies:

``` bash
sudo apt install libx11-dev
sudo apt install libmagick++-dev
sudo apt install libxaw7-dev
sudo apt install libgccjit-11-dev # assuming GCC 11
sudo apt install libgif-dev gnutls-bin libtree-sitter-dev
sudo apt install libgnutls28-dev
sudo apt install libjansson-dev
sudo apt install libncurses-dev
sudo apt install libharfbuzz-dev
```

Then configure with:

``` bash
./configure --with-xml2 --with-native-compilation --with-imagemagick --with-x-toolkit=lucid --with-json 'CFLAGS=-O2 -march=native -fomit-frame-pointer' --with-tree-sitter
```
