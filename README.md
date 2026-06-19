# eBits NixOS Config

- **WM**: [River](https://github.com/riverwm/river) / [Niri](https://github.com/YaLTeR/niri)
- **Bar**: [Waybar](https://github.com/Alexays/Waybar)
- **Launcher**: [Fuzzel](https://codeberg.org/dnkl/fuzzel)
- **Notifications**: [Fnott](https://codeberg.org/dnkl/fnott)
- **Terminals**: [Kitty](https://github.com/kovidgoyal/kitty) / [Foot](https://codeberg.org/dnkl/foot) / [Ghostty](https://github.com/ghostty-org/ghostty)
- **Shell**: [Fish](https://github.com/fish-shell/fish-shell)
- **Editor**: [Neovim](https://github.com/neovim/neovim) / [Emacs](https://www.gnu.org/software/emacs/)
- **Prompt**: [Starship](https://starship.rs)
- **DM**: [LY](https://github.com/fairyglade/ly)
- **Browser**: [Firefox](https://www.mozilla.org/firefox/) / [Qutebrowser](https://qutebrowser.org/)

## Structure

```
├── flake.nix                        # Entry point (defines nixosConfigurations + homeConfigurations)
├── hosts/
│   └── workstation/                 # Per-host config
│       ├── configuration.nix        # Host entry (imports modules + hardware)
│       ├── hardware-configuration.nix
│       └── local-packages.nix       # Host-specific packages
├── nixos/
│   └── modules/                     # NixOS system modules
│       ├── default.nix              # Auto-imports all
│       ├── boot.nix                 # GRUB bootloader
│       ├── nvidia.nix               # NVIDIA GPU
│       ├── networking.nix           # NetworkManager
│       ├── locale.nix               # Timezone, locale, keyboard
│       ├── services.nix             # LY, PipeWire, printing
│       ├── fonts.nix                # Fonts + fontconfig
│       ├── users.nix                # User account
│       └── system.nix               # Global settings, packages
├── home-manager/
│   ├── home.nix                     # Home Manager entry
│   ├── home-packages.nix            # User packages
│   └── modules/                     # Home Manager modules
│       ├── default.nix              # Auto-imports all
│       ├── fish.nix                 # Fish shell
│       ├── git.nix                  # Git config
│       ├── gtk.nix                  # GTK theme
│       ├── starship.nix             # Starship prompt
│       ├── btop.nix                 # System monitor
│       ├── fastfetch.nix            # Fetch tool
│       ├── tmux.nix                 # Tmux
│       ├── zathura.nix              # PDF viewer
│       ├── lazygit.nix              # Git TUI
│       ├── kitty.nix                # Kitty terminal
│       ├── foot.nix                 # Foot terminal
│       ├── neovim.nix               # Neovim
│       └── dotfiles.nix             # Raw config symlinks
├── dotfiles/                        # Mirrors $HOME (stow-style)
│   ├── .config/
│   │   ├── river/
│   │   ├── waybar/
│   │   ├── fuzzel/
│   │   ├── fnott/
│   │   ├── ghostty/
│   │   ├── btop/
│   │   ├── fastfetch/
│   │   ├── wlogout/
│   │   ├── nvim/
│   │   ├── qutebrowser/
│   │   ├── fish/
│   │   ├── yazi/
│   │   ├── cava/
│   │   ├── mpd/
│   │   ├── rmpc/
│   │   └── rill/
│   ├── .local/bin/
│   └── .ssh/
└── screenshots/
```

## Setup

### 1. Clone & enter

```bash
git clone https://github.com/embeddingbits/nixos-config.git /etc/nixos
cd /etc/nixos
```

### 2. Generate hardware config

```bash
nixos-generate-config --show-hardware-config > hosts/workstation/hardware-configuration.nix
```

### 3. Apply system config

```bash
sudo nixos-rebuild switch --flake .#workstation
```

### 4. Apply home-manager config

```bash
home-manager switch --flake .#ebits
```

### 5. (Optional) Set login shell

```bash
chsh -s $(which fish)
```

### 6. Install fonts & themes

Put your `Gruvbox-Dark` GTK theme and `Gruvbox-Plus-Dark` icon theme in `~/.themes` and `~/.icons`, or use a Nix package that provides them.

## Keybinds (River/Rill)

| Key | Action |
|---|---|
| Super + Q | Launch terminal (foot) |
| Super + Return | Launch Emacs |
| Super + R | App launcher (fuzzel) |
| Super + W | Firefox |
| Super + C | Close window |
| Super + F | Fullscreen |
| Super + V | Toggle float |
| Super + H/J/K/L | Focus left/down/up/right |
| Super + Shift + H/L | Move column left/right |
| Super + 1-0 | Switch workspace |
| Super + Shift + 1-0 | Move window to workspace |
| Super + B | Bluetooth menu |
| Super + U | Emoji picker |
| Super + S | Screenshot (region) |
| Super + Shift + L | Lock screen |
