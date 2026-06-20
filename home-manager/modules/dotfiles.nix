{ config, lib, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-config/dotfiles";
  configDir = "${dotfiles}/.config";

  configDirs = [
    "btop"
    "cava"
    "fastfetch"
    "fnott"
    "fuzzel"
    "ghostty"
    "lazygit"
    "mpd"
    "niri"
    "qutebrowser"
    "river"
    "rill"
    "rmpc"
    "waybar"
    "wlogout"
    "yazi"
    "zathura"
  ];

  configLinks = builtins.listToAttrs (
    map (name: {
      name = ".config/${name}";
      value = {
        source = config.lib.file.mkOutOfStoreSymlink "${configDir}/${name}";
      };
    }) configDirs
  );
in
{
  home.file = configLinks // {
    ".emacs.d" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${dotfiles}/.emacs.d";
    };

    ".tmux.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${dotfiles}/.tmux.conf";
    };

    ".local/bin/sshot" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${dotfiles}/sshot";
    };

    "typstDocTemplate" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${dotfiles}/typstDocTemplate";
    };
  };
}
