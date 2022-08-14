# dotfiles
my very own dotfiles. use bash for shell.
![alt text](https://github.com/kyuure/dotfiles/blob/main/.screenshot/5.png "ssan doang | as in 10/05/2022")
I made this repo so that I can backup my dotfiles easily.


## what i use
Kali WSL2. (but it is compatible with OSX since i use that lately)


## what i do

### to install it to my Linux-like env
```sh
# Download the resource
cd
curl -#L https://github.com/kyuure/dotfiles/tarball/main \
  | tar xzv --strip-components 1 \
    --exclude={README.md,.screenshot,.win_terminal}

# Update package
sudo apt update -y
sudo apt full-upgrade -y

# Download necessary package
sudo apt -y install htop clang fzf bat python3 python3-pip ripgrep tree tig
pip install jedi

# Install nodejs
sudo curl -sL install-node.now.sh/lts | bash

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Add undodir for vim
cd ~/.vim
mkdir undodir

# Go back to home dir
cd

# Install vim plugins
vim +PlugInstall +qall

# Append fzf keybind to ~/.bashrc
cat >> ~/.bashrc <<EOL
# enable ctrl-r fzf
source /usr/share/doc/fzf/examples/key-bindings.bash
EOL
```

### to install it to my OSX-like env
```sh
# Download the resource
cd
curl -#L https://github.com/kyuure/dotfiles/tarball/main \
  | tar xzv --strip-components 1 \
    --exclude={README.md,.screenshot,.win_terminal}

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Download necessary package
brew install htop fzf bat ripgrep tree tig node tmux
/usr/local/opt/fzf/install

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Add undodir for vim
cd ~/.vim
mkdir undodir

# Go back to home dir
cd

# Install vim plugins
vim +PlugInstall +qall
```

### setup git and ssh
```sh
# Setup git
git config --global user.name "my-name"
git config --global user.email "my-email"

# Setup SHH Key
ssh-keygen -t rsa -C "my-email"
ssh -T git@github.com
```
