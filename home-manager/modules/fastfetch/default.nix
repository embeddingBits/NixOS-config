{ pkgs, config, lib, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-config/dotfiles";
in {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "small";
        source = "nixos";
        padding = {
          top = 1;
        };
      };
      display = {
        separator = "   ";
        key = {
          width = 7;
        };
      };
      modules = [
        {
          type = "title";
          color = {
            user = "green";
            at = "red";
            host = "blue";
          };
        }
        {
          key = "{icon} ";
          type = "os";
          keyColor = "blue";
        }
        {
          key = " ";
          type = "kernel";
          keyColor = "blue";
        }
        {
          type = "wm";
          key = " ";
          keyColor = "blue";
        }
        {
          key = " ";
          type = "terminal";
          keyColor = "blue";
        }
        {
          key = " ";
          type = "shell";
          keyColor = "blue";
        }
        {
          key = "󰉉 ";
          type = "disk";
          folders = "/";
          keyColor = "blue";
        }
        {
          key = " ";
          type = "memory";
          keyColor = "blue";
        }
        {
          key = " ";
          type = "colors";
          symbol = "circle";
          keyColor = "blue";
        }
      ];
    };
  };

  xdg.configFile."fastfetch/kitty.jsonc" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/fastfetch/kitty.jsonc";
  };
  xdg.configFile."fastfetch/logo.png" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/fastfetch/logo.png";
  };
}
