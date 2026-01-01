# Dotfiles

My personal dotfiles, managed using a bare Git repository with `$HOME` as the working tree. This allows me to version control selected config files without turning my home directory into a Git repo.

## Setup (primary machine)

```bash
git init --bare ~/.dotfiles
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
dot config status.showUntrackedFiles no
```

Persist `dot` alias in your shell config (e.g. ~/.zshrc)

```bash
echo 'alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"' >> ~/.zshrc
source ~/.zshrc
```

## Usage

Add and commit files:

```bash
dot add ~/.zshrc ~/.config/opencode/config.json
dot commit -m "Update dotfiles"
dot push
```

Pull from remote:

```bash
dot pull
```

Apply updates to `$HOME`:

```bash
dot checkout
```

## Setup (secondary machine)

```bash
git clone --bare git@github.com:sethcarlton/dotfiles.git ~/.dotfiles
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dot config status.showUntrackedFiles no
dot checkout
```

## Install Dependencies

Make executable and run the install script:

```bash
chmod +x ~/install.sh
~/install.sh
```
