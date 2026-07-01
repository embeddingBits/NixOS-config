{ pkgs, config, homeStateVersion, user, inputs, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
    inputs.stylix.homeModules.stylix
    inputs.ebits-nixvim.homeManagerModules.default
  ];

  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = homeStateVersion;

  home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        TERMINAL = "foot";
        LANG = "en_US.UTF-8";
        SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gcr/ssh";
        XCURSOR_THEME = "Bibata-Modern-Amber";
        XCURSOR_SIZE = "24";
  };
  programs.nixvim.enable = true;

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
