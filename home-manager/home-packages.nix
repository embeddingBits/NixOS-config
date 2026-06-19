{ lib, pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    niri
    fuzzel fnott waybar wlogout
    kitty foot ghostty
    fish starship
    btop fastfetch cava
    mpd rmpc pavucontrol playerctl
    ffmpeg imagemagick
    yazi zathura
    lazygit
    obs-studio firefox vesktop
    neovim emacs
    steam-run libgcc gcc zig go gnumake
    python313 python313Packages.pip
    lua-language-server
    ripgrep fd fzf jq bat eza
    grim slurp grimblast hyprpicker
    nwg-look wlr-randr swaylock wl-clipboard wtype swaybg
    xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr
    wayland-utils wayland-scanner pkg-config
    brightnessctl libnotify
    nerd-fonts.jetbrains-mono nerd-fonts.iosevka
    flatpak zip unzip unrar
    gparted mesa-demos
    bluez bluez-tools
    xdg-utils
    xwayland-satellite
    zoxide
    inputs.heliim.packages.${pkgs.system}.default
  ];
}
