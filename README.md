# dotfiles v2
my very own dotfiles. use bash for shell.
![alt text](https://github.com/kyuure/dotfiles/blob/main/.screenshot/6.png "ssan doang at 08/06/2024")
I made this repo so that I can backup my dotfiles easily.


## what i use
- Ubuntu 24.04 LTS WSL2.
- MacOS M1


## what i do

### to install it to my UNIX-like env
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
# Source: https://learn.microsoft.com/en-us/windows/dev-environment/javascript/nodejs-on-wsl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Add undodir for vim
mkdir -p ~/.vim/undodir

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
mkdir -p ~/.vim/undodir

# Install vim plugins
vim +PlugInstall +qall
```

### setup git and ssh
```sh
# Setup git
git config --global user.name "My Name"
git config --global user.email "my@email"

# Setup SHH Key
ssh-keygen -t ed25519 -C "my@email"
ssh -T git@github.com
```
