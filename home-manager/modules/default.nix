{ lib, pkgs, inputs, ... }: {
  imports = [
    ./dotfiles.nix
    ./gtk.nix
    ./kitty
    ./foot
    ./starship
  ];
}
