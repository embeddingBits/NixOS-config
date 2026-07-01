{ lib, pkgs, ... }: {

  config = {

    stylix.cursor = {
      name = "Bibata-Modern-Amber";
      package = pkgs.bibata-cursors;
      size = 20;
    };

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
      };
    };
  };
}
