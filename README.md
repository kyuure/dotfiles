# dotfiles
my very own dotfiles. use bash for shell.
![alt text](https://github.com/kyuure/dotfiles/blob/main/.screenshot/2.png "ssan doang | as in 17/03/2021")
I made this repo so that I can backup my dotfiles easily.


## what i use
Kali WSL2.

_why?_ hmm🤔


## what i do after install a new fresh terminal
```sh
sudo apt install htop
sudo apt install clang
sudo apt install fzf
sudo apt install bat
#sudo apt install exuberant-ctags
#sudo apt install strace ltrace
#sudo apt install iotop
#sudo apt install iostat vmstat

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
