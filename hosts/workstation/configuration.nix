{ pkgs, stateVersion, hostname, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../nixos/modules
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;

  programs.river-next = {
    enable = true;
    windowManagers = [ "rill" ];
  };
}
