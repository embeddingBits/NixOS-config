{ pkgs, config, lib, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-config/dotfiles";
in {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        output = "ePD-1, HDMI-A-1";
        font = "JetBrainsMono Nerd Font:style=semibold:size=10";
        dpi-aware = "yes";
        use-bold = "yes";
      };
      colors = {
        background = "282828ff";
        text = "ebdbb2ff";
        message = "657b83ff";
        prompt = "ebdbb2ff";
        border = "dfa657ff";
      };
      border = {
        width = 2;
        radius = 0;
      };
    };
  };

  xdg.configFile."fuzzel/fuzzel-launch.sh" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/fuzzel/fuzzel-launch.sh";
  };
  xdg.configFile."fuzzel/fuzzel-bluetooth.sh" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/fuzzel/fuzzel-bluetooth.sh";
  };
  xdg.configFile."fuzzel/fuzzel-search.sh" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/fuzzel/fuzzel-search.sh";
  };
  xdg.configFile."fuzzel/fuzzel-emoji.sh" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/fuzzel/fuzzel-emoji.sh";
  };
  xdg.configFile."fuzzel/emojis.txt" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/fuzzel/emojis.txt";
  };
}
