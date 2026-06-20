{ pkgs, config, homeStateVersion, user, inputs, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
    inputs.stylix.homeModules.stylix
    inputs.nixvim.homeModules.nixvim
    ./../dotfiles/nixvim
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

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/git";
      };
      "codeberg.org" = {
        HostName = "codeberg.org";
        User = "git";
        IdentityFile = "~/.ssh/git";
      };
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ebits";
        email = "tspamiitesh@gmail.com";
      };
      core = {
        editor = "nvim";
        pager = "less -FRX";
        excludesfile = "~/.config/git/gitignore_global";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      alias = {
        st = "status -b";
        co = "checkout";
        com = "commit -m";
        br = "branch";
        lg = "log --oneline --graph --decorate --all";
      };
      url = {
        "git@github.com:".insteadOf = "https://github.com/";
        "git@codeberg.org:".insteadOf = "https://codeberg.org/";
      };
    };
  };

  programs.fish = {
    enable = true;

    shellInit = ''
      set fish_greeting
      set -x BAT_THEME gruvbox-dark
      set -x TERMINAL footclient
      set -Ux PATH /opt/cuda/bin $PATH
      set -Ux LD_LIBRARY_PATH /opt/cuda/lib64 $LD_LIBRARY_PATH
      set --export BUN_INSTALL "$HOME/.bun"
      set --export PATH $BUN_INSTALL/bin $PATH
      set -Ux GOPATH $HOME/.local/go
      set -Ux GOBIN  $HOME/.local/go/bin
      fish_add_path $GOBIN
      test -f "/home/ebits/.openclaw/completions/openclaw.fish"; and source "/home/ebits/.openclaw/completions/openclaw.fish"
    '';

    interactiveShellInit = ''
      starship init fish | source
      zoxide init fish | source
    '';

    functions = {
      fetch = {
        description = "alias fetch fastfetch -c ~/.config/fastfetch/small.jsonc --logo-color-1 blue --logo-color-2 red";
        wraps = "fastfetch";
        body = "fastfetch -c ~/.config/fastfetch/small.jsonc --logo-color-1 blue --logo-color-2 red $argv";
      };
      ls = {
        description = "alias ls exa --icons";
        wraps = "exa";
        body = "exa --icons $argv";
      };
      nv = {
        description = "alias nv nvim";
        wraps = "nvim";
        body = "nvim $argv";
      };
    };

    shellAliases = {
      gt = "git status";
      gp = "git push";
      ga = "git add";
      gl = "git log";
      gc = "git commit -m";
      gu = "git pull";
      j = "z";
      tree = "ls --tree";
      zb = "zig build";
      upfor = "uptime -p";
      pac = "sudo pacman";
      pacref = "sudo pacman -Syy";
      pacup = "sudo pacman -Syyu";
      tnew = "tmux new -s";
      tls = "tmux ls";
      ta = "tmux attach -t";
      td = "tmux detach";
    };
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
