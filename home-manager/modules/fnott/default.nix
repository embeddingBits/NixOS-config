{ pkgs, config, lib, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-config/dotfiles";
in {
  services.fnott = {
    enable = true;
    settings = {
      max_width = 450;
      background = "282828ff";
      border_color = "d8a657ff";
      border_size = 2;
      title_font = "JetBrainsMono NFP:style=bold:size=15";
      title_color = "ebdbb2ff";
      summary_font = "JetBrainsMono NFP:style=bold:size=12";
      summary_color = "ebdbb2ff";
      body_font = "JetBrainsMono NFP:style=bold:size=12";
      body_color = "ebdbb2ff";
      max_timeout = 5;
      default_timeout = 5;
      idle_timeout = 0;
      play_sound = "aplay ${config.xdg.configHome}/fnott/alert.wav";
    };
  };

  xdg.configFile."fnott/alert.wav" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/fnott/alert.wav";
  };
}
