{ pkgs, config, ... }:

let
  sshPubKey = builtins.readFile /home/ebits/.ssh/git.pub;
in
{
  home.file.".ssh/allowed_signers".text = "* ${sshPubKey}";

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        identitiesOnly = "yes";
        preferredAuthentications = "publickey";
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/git";
      };
      "codeberg.org" = {
        hostname = "codeberg.org";
        user = "git";
        identityFile = "~/.ssh/git";
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
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/git.pub";
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
