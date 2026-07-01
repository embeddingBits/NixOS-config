{ pkgs, ... }: {
  home.file.".config/environment.d/90-ssh-agent.conf".text = ''
    SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
  '';

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
}
