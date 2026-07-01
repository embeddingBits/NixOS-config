{ lib, pkgs, ... }: {
  imports = [
    ./stylix.nix
  ];

  hardware.bluetooth.enable = true;

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi.canTouchEfiVariables = true;
  };

  programs.dconf.enable = true;
  programs.nix-ld.enable = true;

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Iosevka Nerd Font Propo" ];
        serif = [ "Iosevka Nerd Font Propo" ];
        monospace = [ "Iosevka Nerd Font Propo" ];
      };
    };
  };

  time.timeZone = "Asia/Kolkata";

i18n = {
  defaultLocale = "en_US.UTF-8";

  extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
};

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  networking = {
    networkmanager.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
  };

  hardware.graphics.enable = true;

  services.xserver.enable = true;

  services.displayManager.ly.enable = true;

  services.xserver.displayManager.session = [
    {
      manage = "window";
      name = "rill";
      start = ''
        exec rill
      '';
    }
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.niri.enable = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    emacs
    wget
    git
    fish
    starship
    home-manager
  ];
    
   services.openssh = {
     enable = true;
     settings = {
           PasswordAuthentication = false;
           KbdInteractiveAuthentication = false;
     };
   };   


  users.users.ebits = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "ebits";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
