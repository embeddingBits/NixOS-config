{ lib, pkgs, ... }: {
  options.services.kmscon.config = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    default = {};
    visible = false;
    description = "Compat shim for stylix kmscon module";
  };

  config = {
    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
      polarity = "dark";
      targets.kmscon.enable = false;
      image = ./sushi.jpg; 

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Propo";
        };
        sansSerif = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Propo";
        };
        serif = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Propo";
        };
        sizes = {
          applications = 10;
          terminal = 12;
          desktop = 10;
          popups = 10;
        };
      };
    };
  };
}
