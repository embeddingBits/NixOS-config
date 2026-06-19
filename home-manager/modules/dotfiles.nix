{ config, lib, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-config/dotfiles";
  configDir = "${dotfiles}/.config";

  configDirs = [
    "btop"
    "cava"
    "fastfetch"
    "fish"
    "fnott"
    "foot"
    "fuzzel"
    "ghostty"
    "git"
    "kitty"
    "lazygit"
    "mpd"
    "niri"
    "nvim"
    "qutebrowser"
    "river"
    "rill"
    "rmpc"
    "starship.toml"
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

    ".ssh/config" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${dotfiles}/.ssh/config";
    };

    "typstDocTemplate" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${dotfiles}/typstDocTemplate";
    };
  };
}
