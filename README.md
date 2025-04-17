# Dotfiles

A curated configuration for setting up a productive development environment on **Ubuntu**, using a **bare Git repository** approach to track your `$HOME` dotfiles.

---

## 📦 Features

- ⚡ **Neovim** with LSP, Treesitter, Telescope, FZF, Neogit, and Diffview
- 💻 **Zsh** with autosuggestions, syntax highlighting, and `starship` prompt
- 🔍 **Fuzzy finder** setup with `fzf-lua` and `ripgrep`
- 🔧 **Git-aware dev environment** with Diffview, Neogit, and more

---

## 🚀 Installation

### 1. Install Dependencies

Run this on Ubuntu:

```bash
sudo apt update && sudo apt install -y \
git neovim zsh ripgrep fzf curl wget \
nodejs npm python3 python3-pip unzip \
build-essential
```

### 2. Install Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
#### Zsh Autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

##### Zsh Syntax Highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 3. Install  Nerd Font (eg. FiraCode)
```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip
fc-cache -fv
```

### 4. Clone dotfiles
```bash
git clone --bare https://github.com/pedroargento/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

If files already exist and conflict:
```bash
dotfiles checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} rm -rf {}
dotfiles checkout
```
```bash
dotfiles config --local status.showUntrackedFiles no
```

```bash
echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'" >> ~/.zshrc
source ~/.zshrc
```
## Workflow keymapping:
| Mapping       | Plugin    | Description                          |
|---------------|-----------|--------------------------------------|
| `<leader>gs`  | Neogit    | Git status UI                       |
| `<leader>gd`  | Diffview  | Full diff view of current changes    |
| `<leader>gh`  | Diffview  | File history of the current file     |
| `<leader>gH`  | Diffview  | Full repository history              |
| `<leader>gf`  | fzf-lua   | Git-tracked files picker             |
| `<leader>gb`  | fzf-lua   | Git branches switcher                |
| `<leader>gc`  | fzf-lua   | Git commits fuzzy finder             |
| `<leader>gg`  | fzf-lua   | Live grep in the current repo        |
