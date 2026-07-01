{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
  ];
  fonts.packages = with pkgs; [
    corefonts
  ];
}
