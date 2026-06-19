{ homeStateVersion, user, inputs, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
    inputs.stylix.homeModules.stylix
  ];

  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = homeStateVersion;

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
