{ lib, pkgs, inputs, ... }: {
  imports = [
    ./dotfiles.nix
    ./gtk.nix
  ];
}
