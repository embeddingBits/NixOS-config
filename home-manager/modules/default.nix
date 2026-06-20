{ lib, pkgs, inputs, ... }: {
  imports = [
    ./cli
    ./dotfiles.nix
    ./fish
    ./gtk.nix
    ./kitty
    ./foot
    ./starship
  ];
}
