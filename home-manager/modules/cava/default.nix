{ pkgs, config, lib, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-config/dotfiles";
in {
  programs.cava = {
    enable = true;
    settings = {
      color = {
        gradient = 1;
        gradient_color_1 = "'#7daea3'";
        gradient_color_2 = "'#a9b665'";
        gradient_color_3 = "'#D8A657'";
        gradient_color_4 = "'#e78a4e'";
        gradient_color_5 = "'#ea6962'";
        gradient_color_6 = "'#d3869b'";
        gradient_color_7 = "'#a9b665'";
        gradient_color_8 = "'#ebdbb2'";
      };
    };
  };

  xdg.configFile."cava/shaders" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/cava/shaders";
  };

  xdg.configFile."cava/themes" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/cava/themes";
  };
}
