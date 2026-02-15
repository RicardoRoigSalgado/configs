#!/usr/bin/env bash
set -euo pipefail

CONFIGS_DIR="$(cd "$(dirname "$0")" && pwd)"
OS="$(uname -s)"

echo "Setting up configs from $CONFIGS_DIR on $OS..."

# Install dependencies
if [ "$OS" = "Darwin" ]; then
    if ! command -v brew &>/dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install tmux neovim ripgrep fd node git curl
elif [ "$OS" = "Linux" ]; then
    sudo apt update
    sudo apt install -y tmux ripgrep fd-find nodejs npm git curl build-essential

    # Install neovim (latest stable via appimage or PPA since apt version is often outdated)
    if ! command -v nvim &>/dev/null || [[ "$(nvim --version | head -1 | grep -oP '\d+\.\d+')" < "0.9" ]]; then
        echo "Installing latest Neovim..."
        sudo apt install -y software-properties-common
        sudo add-apt-repository -y ppa:neovim-ppa/stable
        sudo apt update
        sudo apt install -y neovim
    fi
fi

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Powerlevel10k if not present
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
    echo "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

# Install TPM (Tmux Plugin Manager) if not present
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Symlink configs
symlink() {
    local src="$1"
    local dest="$2"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "  Backing up existing $dest -> ${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi
    mkdir -p "$(dirname "$dest")"
    ln -sf "$src" "$dest"
    echo "  $src -> $dest"
}

echo ""
echo "Symlinking config files..."
symlink "$CONFIGS_DIR/.tmux.conf" "$HOME/.tmux.conf"
symlink "$CONFIGS_DIR/.config/nvim" "$HOME/.config/nvim"
symlink "$CONFIGS_DIR/.zshrc" "$HOME/.zshrc"

if [ -d "$CONFIGS_DIR/.config/ghostty" ]; then
    symlink "$CONFIGS_DIR/.config/ghostty" "$HOME/.config/ghostty"
fi

# Install MesloLGS NF font
if [ -f "$CONFIGS_DIR/MesloLGS NF Regular.ttf" ]; then
    if [ "$OS" = "Darwin" ]; then
        FONT_DIR="$HOME/Library/Fonts"
    else
        FONT_DIR="$HOME/.local/share/fonts"
    fi
    mkdir -p "$FONT_DIR"
    cp "$CONFIGS_DIR/MesloLGS NF Regular.ttf" "$FONT_DIR/"
    if [ "$OS" = "Linux" ]; then
        fc-cache -fv &>/dev/null || true
    fi
    echo "  Installed MesloLGS NF font to $FONT_DIR"
fi

echo ""
echo "Done! Next steps:"
echo "  1. Open tmux and press prefix + I to install tmux plugins"
echo "  2. Open nvim — LazyVim will auto-install plugins on first launch"
echo "  3. Run 'p10k configure' if the Powerlevel10k prompt needs setup"
