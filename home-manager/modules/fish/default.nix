{ pkgs, ... }: {
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
        description = "alias fetch fastfetch --logo-color-1 blue --logo-color-2 red";
        wraps = "fastfetch";
        body = "fastfetch --logo-color-1 blue --logo-color-2 red $argv";
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
      tree = "eza --tree --icons";
      ls = "eza --icons";
      zb = "zig build";
      nv = "nvim";
      tnew = "tmux new -s";
      tls = "tmux ls";
      ta = "tmux attach -t";
      td = "tmux detach";
    };
  };
}
