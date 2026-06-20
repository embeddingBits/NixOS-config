{ lib, pkgs, inputs, ... }: {
  imports = [
    ./dotfiles.nix
    ./git.nix
    ./gtk.nix
  ];
}
