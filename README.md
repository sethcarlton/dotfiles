# Dotfiles

Personal dotfiles managed using a bare Git repository with `$HOME` as the working tree. This allows version controlling config files without turning the home directory into a Git repo.

## Setup

Clone on a new machine:

```bash
git clone --bare git@github.com:sethcarlton/dotfiles.git ~/.dotfiles
# or if starting fresh: git init --bare ~/.dotfiles

alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

dot config status.showUntrackedFiles no
dot checkout
```

Add `dot` alias to shell config:

```bash
echo 'alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"' >> ~/.zshrc
```

## Usage

```bash
dot add ~/.zshrc
dot commit -m "msg"
dot push
```

## Install

```bash
~/install.sh
```

## Beads

Global task tracking (stealth, not committed):

```bash
mkdir -p ~/Developer/notes && cd ~/Developer/notes
git init
bd init --stealth
```

In project repos (stealth optional):

```bash
bd init
```
