# configs

My dotfiles for macOS and Ubuntu.

## What's included

- **tmux** — prefix `C-Space`, vi mode, vim-tmux-navigator, resurrect/continuum
- **nvim** — LazyVim distro with tmux-navigator integration
- **zsh** — Oh My Zsh + Powerlevel10k
- **ghostty** — terminal config (macOS only)

## Setup

```bash
git clone git@github.com:RicardoRoigSalgado/configs.git ~/repos/configs
cd ~/repos/configs
./setup.sh
```

The script will:
1. Install dependencies (tmux, neovim, ripgrep, fd, node)
2. Install Oh My Zsh + Powerlevel10k
3. Install TPM (tmux plugin manager)
4. Symlink all configs to their expected locations
5. Install the MesloLGS NF font

After running:
- Open tmux and press `C-Space + I` to install tmux plugins
- Open nvim — LazyVim will auto-install plugins on first launch
- Run `p10k configure` if needed
