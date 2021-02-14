# dotfiles
my very own dotfiles. use bash for shell.
I make this repo so that I can backup my dotfiles easily.

## what i use
Kali WSL
why? hmm🤔

## what i do after install a new fresh terminal
```
sudo apt install htop
sudo apt install clang
sudo apt install fzf
sudo apt install bat
#sudo apt install exuberant-ctags

sudo apt install python3
sudo pip install jedi

# why? because i want to.
curl -fsSL https://starship.rs/install.sh | bash

# https://github.com/wslutilities/wslu
sudo apt install gnupg2 apt-transport-https
wget -O - https://access.patrickwu.space/wslu/public.asc | sudo apt-key add -
echo "deb https://access.patrickwu.space/wslu/debian buster main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install wslu
```

## cheatsheet wslu
  1. wslfetch: A WSL screenshot information tool to print information in an elegant way.
  2. wslview: A fake WSL browser that can help you open link in default Windows browser or open files on Windows.
  3. wslupath (⚠ Deprecated): A WSL tool to convert path styles.
