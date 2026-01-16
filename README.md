# dotfiles v3
my very own dotfiles. use bash for shell.
[//]: <> (![alt text](https://github.com/kyuure/dotfiles/blob/main/.screenshot/6.png "ssan doang at 08/06/2024"))
I made this repo so that I can backup my dotfiles easily.


## what i use
- Ubuntu 24.04 LTS WSL2.
- MacOS M1


## what i do

### to install it using bootstrap.sh
tried to make it as simple as possible
```sh
chmod +x bootstrap.sh
. bootstrap.sh

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
