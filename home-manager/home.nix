{ homeStateVersion, user, inputs, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
    inputs.stylix.homeModules.stylix
  ];

  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = homeStateVersion;

  home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        TERMINAL = "foot";
        LANG = "en_US.UTF-8";
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
