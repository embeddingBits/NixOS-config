{ lib, pkgs, inputs, ... }: {
  imports = [
    ./btop
    ./cava
    ./fastfetch
    ./fnott
    ./fuzzel
    ./cli
    ./dotfiles.nix
    ./fish
    ./gtk.nix
    ./kitty
    ./foot
    ./river
    ./rill
    ./starship
    ./zathura
  ];
}
