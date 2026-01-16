# dotfiles v3
my very own dotfiles. use bash for shell.

I made this repo so that I can backup my dotfiles easily.


## what i use
- Ubuntu 24.04 LTS WSL2.
- MacOS M1


## prerequisite
- whatever tools you use to clone this repo (Git is recommended)


## what i do

### to clone this repo

#### on my mac
```
if ! command -v brew &> /dev/null; then
  echo "Error: Homebrew is required to install Git on macOS."
  return 1
fi
brew install git
git clone https://github.com/kyuure/dotfiles.git
cd dotfiles
```

#### on my debian/wsl2
```
sudo apt-get update
sudo apt-get install -y git
git clone https://github.com/kyuure/dotfiles.git
cd dotfiles
```


### to install it using bootstrap.sh
tried to make it as simple as possible
```sh
chmod +x bootstrap.sh
./bootstrap.sh
```
untested. !DO NOT USE THIS!


### setup git and ssh
```sh
# Setup git
git config --global user.name "My Name"
git config --global user.email "my@email"

# Setup SHH Key
ssh-keygen -t ed25519 -C "my@email"
ssh -T git@github.com
```
