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
    # Applications
    obs-studio mpv onlyoffice-desktopeditors firefox vesktop
    emacs
    steam-run libgcc gcc zig go gnumake
    python313 python313Packages.pip
    lua-language-server
    ripgrep fd fzf jq bat eza
    grim slurp grimblast hyprpicker
    # Wayland
    nwg-look wlr-randr swaylock wl-clipboard wtype swaybg
    xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr
    wayland-utils wayland-scanner pkg-config
    brightnessctl libnotify hyprshot
    # Fonts
    nerd-fonts.jetbrains-mono nerd-fonts.iosevka
    # Zip and rar
    zip unzip unrar
    # Disk Utilities
    gparted mesa-demos
    # Bluetooth
    bluez bluez-tools blueman
    xdg-utils
    xwayland-satellite
    zoxide
    inputs.heliim.packages.${pkgs.system}.default
  ];
}
