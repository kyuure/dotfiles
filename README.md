# dotfiles
my very own dotfiles. use bash for shell.
![alt text](https://github.com/kyuure/dotfiles/blob/main/.screenshot/4.png "ssan doang | as in 17/03/2021")
I made this repo so that I can backup my dotfiles easily.


## what i use
Kali WSL2.

_why?_ hmm🤔


## what i do

### to install it to my env
```sh
# Download the resource.
cd
curl -#L https://github.com/kyuure/dotfiles/tarball/main \
  | tar xzv --strip-components 1 \
    --exclude={README.md,.screenshot,.win_terminal}

# Update package.
sudo apt update -y
sudo apt full-upgrade -y

# Download necessary package.
sudo apt -y install htop clang fzf bat python3 jedi

# Install nodejs
curl -sL install-node.now.sh/lts | bash

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Add undodir for vim
cd ~/.vim
mkdir undodir

# go back to home dir
cd
```

### after install a new fresh wsl
```sh
#sudo apt install exuberant-ctags
#sudo apt install strace ltrace
#sudo apt install iotop
#sudo apt install iostat vmstat

# Source: https://github.com/wslutilities/wslu
sudo apt install gnupg2 apt-transport-https
wget -O - https://access.patrickwu.space/wslu/public.asc | sudo apt-key add -
echo "deb https://access.patrickwu.space/wslu/debian buster main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install wslu
```
