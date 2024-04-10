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

