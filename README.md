# Zsh

Install zsh with apt. Install the zshrc with the below command:

ln -s ~/dotfiles/zshrc ~/.zshrc

Note that the zshrc assumes that the repository is located in ~/dotfiles

# Emacs

Install the latest emacs. I usually install from source to get the latest version.
Prelude is present, but no longer maintained, so we use doom. To install:

ln -s ~/dotfiles/doom.d ~/.doom.d
ln -s ~/dotfiles/doomemacs ~/.emacs.d
