{ pkgs, config, lib, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-config/dotfiles";
in {
  services.fnott = {
    enable = true;
    settings = {
      main = {
        max-width = 450;
        background = "282828ff";
        border-color = "d8a657ff";
        border-size = 2;
        title-font = "JetBrainsMono NFP:style=bold:size=15";
        title-color = "ebdbb2ff";
        summary-font = "JetBrainsMono NFP:style=bold:size=12";
        summary-color = "ebdbb2ff";
        body-font = "JetBrainsMono NFP:style=bold:size=12";
        body-color = "ebdbb2ff";
        max-timeout = 5;
        default-timeout = 5;
        idle-timeout = 0;
        play-sound = "aplay ${config.xdg.configHome}/fnott/alert.wav";
      };
    };
  };

  xdg.configFile."fnott/alert.wav" = {
    source = ./alert.wav; 
  };
}
