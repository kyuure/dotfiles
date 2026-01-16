#!/usr/bin/env bash


# define your required tools here
packages=(
  "curl"
  "git"

  "vim"
  "nvim"
  "tmux"
  "htop"
  "bat"
  "tree"
  "fzf"
  "ripgrep"
  "kubectl"
  "tig"
  "gpg"

  "python3"
  "go"
  "clang"
  "nvim"

  "eza"   # https://github.com/eza-community/eza
  "stern" # https://github.com/stern/stern
)


# exit immediately if a command fails
set -e
# treat unset variables as an error
set -u
# ensure pipeline failures are captured
set -o pipefail

# check os
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS-specific code
  export PLATFORM="macos"
elif [[ -f /proc/version ]] && grep -qi microsoft /proc/version; then
  # WSL 1 or 2 specific code
  export PLATFORM="wsl"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export PLATFORM="linux"
else
  export PLATFORM="unknown"
fi

DOTFILES_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
BACKUP_DIR="$HOME/.backup/$(date +%Y%m%d_%H%M%S)"
export PATH="$HOME/.local/bin:$PATH"


# install package
install_package() {
  local pkg=$1

  # check if the package is already installed
  if command -v "$pkg" &> /dev/null; then
    echo "✓ $pkg is already installed."
    return 0
  fi

  echo "Installing $pkg for $PLATFORM..."

  # execute platform-specific installation
  case "$PLATFORM" in
    "macos")
      if command -v brew &> /dev/null; then
        brew install "$pkg"
      else
        echo "Error: Homebrew not found. Visit https://brew.sh/"
        return 1
      fi
      ;;
    "linux" | "wsl")
      if command -v apt-get &> /dev/null; then
        sudo apt-get update -qq
        sudo apt-get install -y "$pkg"
      elif command -v dnf &> /dev/null; then
        sudo dnf install -y "$pkg"
      elif command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm "$pkg"
      else
        echo "Error: No supported package manager (apt, dnf, pacman) found."
        return 1
      fi
      ;;
    *)
      echo "Error: Unknown platform '$PLATFORM'."
      return 1
      ;;
  esac
}


# link files from $HOME to this dotfiles dir
link_file() {
  local src=$1
  local dst=$2

  if [ ! -e "$src" ]; then
    echo "Warning: Source $src does not exist. Skipping."
    return
  fi

  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    # if the destination exists and is NOT a symlink, back it up
    echo "Backing up $dst"
    local relative_path
    relative_path=$(dirname "$dst" | sed "s|$HOME/||")
    mkdir -p "$BACKUP_DIR/$relative_path"
    mv "$dst" "$BACKUP_DIR/$relative_path/"
  fi

  # create the symbolic link
  echo "Linking $src -> $dst"
  ln -sf "$src" "$dst"
}


cleanup_system() {
  echo "Starting post-installation cleanup..."
  if [[ "$PLATFORM" == "macos" ]]; then
    if command -v brew &> /dev/null; then
      echo "Cleaning up Homebrew cache and old versions..."
      brew cleanup -s
      # remove downloaded cached bottles
      rm -rf "$(brew --cache)"
    fi
  elif [[ "$PLATFORM" == "linux" || "$PLATFORM" == "wsl" ]]; then
    if command -v apt-get &> /dev/null; then
      echo "Removing unused APT dependencies and clearing cache..."
      sudo apt-get autoremove -y
      sudo apt-get autoclean -y
      sudo apt-get clean
    fi
  fi

  # Remove the NVM installer script if it was left in the current dir
  [[ -f "install.sh" ]] && rm "install.sh"

  echo "Cleanup complete."
}



echo "Starting installation process for: $PLATFORM"

# create local/bin dir
mkdir -p "$HOME/.local/bin"

# make sure package manager are latest
echo "Updating package manager repositories..."
if [[ "$PLATFORM" == "macos" ]]; then
  if command -v brew &> /dev/null; then
    brew update
  fi
elif [[ "$PLATFORM" == "linux" || "$PLATFORM" == "wsl" ]]; then
  if command -v apt-get &> /dev/null; then
    sudo apt-get update -y
    sudo apt-get upgrade -y
  fi
fi

# install all packages needed for this dotfiles
for pkg in "${packages[@]}"; do
  case "$pkg" in
    "nvm")
      # use another approach for nvm
      if [ ! -d "$HOME/.nvm" ]; then
        echo "Installing NVM (Node Version Manager)..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

        echo "Installing Node.js LTS..."
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        nvm install --lts
      else
        echo "✓ NVM is already installed."
      fi
      ;;

    "kubectl")
      if ! command -v kubectl &> /dev/null; then
        echo "Installing kubectl binary..."
        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        chmod +x kubectl
        mv kubectl "$HOME/.local/bin/"
      fi
      ;;

    "fzf")
      if [ ! -d "$HOME/.fzf" ]; then
        echo "Installing fzf via git..."
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all
      fi
      ;;

    "go")
      if ! command -v go &> /dev/null; then
        echo "Installing Go..."
        if [[ "$PLATFORM" == "linux" || "$PLATFORM" == "wsl" ]]; then
          curl -LO https://go.dev/dl/go1.25.0.linux-amd64.tar.gz
          sudo tar -C /usr/local -xzf go1.25.0.linux-amd64.tar.gz
          rm go1.25.0.linux-amd64.tar.gz
        else
          install_package "go"
        fi
        export GOROOT=/usr/local/go
        export GOPATH=$HOME/go
        export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
      fi
      ;;

    "eza")
      if [[ "$PLATFORM" == "macos" ]]; then
        brew install eza
      elif [[ "$PLATFORM" == "linux" || "$PLATFORM" == "wsl" ]]; then
        if ! command -v eza &> /dev/null; then
          echo "Installing eza..."
          sudo mkdir -p /etc/apt/keyrings
          wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
          echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
          sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
          sudo apt update
          sudo apt install -y eza
        fi
      fi
      ;;

    "stern")
      if [[ "$PLATFORM" == "macos" ]]; then
        brew install stern
      elif [[ "$PLATFORM" == "linux" || "$PLATFORM" == "wsl" ]]; then
        if ! command -v stern &> /dev/null; then
          echo "Installing stern binary..."
          STERN_VERSION_WITH_V=$(curl -s https://api.github.com/repos/stern/stern/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
          STERN_VERSION=${STERN_VERSION_WITH_V#v}
          curl -Lo stern.tar.gz "https://github.com/stern/stern/releases/download/${STERN_VERSION}/stern_${STERN_VERSION}_linux_amd64.tar.gz"
          tar -xzf stern.tar.gz stern
          chmod +x stern
          mkdir -p "$HOME/.local/bin"
          mv stern "$HOME/.local/bin/"
          rm stern.tar.gz
        fi
      fi
      ;;

    *)
      if [[ "$pkg" == "python3" ]]; then
        if [[ "$PLATFORM" == "linux" || "$PLATFORM" == "wsl" ]]; then
          # make sure to install pip too
          install_package "python3-pip"
        fi
      fi
      install_package "$pkg"
  esac
done

echo "Setting up symlinks..."
link_file "$DOTFILES_ROOT/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_ROOT/.bash_profile" "$HOME/.bash_profile"
link_file "$DOTFILES_ROOT/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_ROOT/.gitignore" "$HOME/.gitignore"
link_file "$DOTFILES_ROOT/.config" "$HOME/.config"

link_file "$DOTFILES_ROOT/.config/tmux/tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_ROOT/.config/vim/.vimrc" "$HOME/.vimrc"

echo "Installing vim plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
mkdir -p ~/.vim/undodir

cleanup_system
echo "Bootstrap complete."
