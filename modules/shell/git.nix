# Configuration for git

{
  programs = {
    git = {
      enable = true;
      userName = "Dennis Al Baihaqi Walangadi";
      userEmail = "dennis.walangadi@gmail.com";

      # Enable the delta syntax highlighter
      delta.enable = true;

      # Default gitignore
      ignores = [
        ".cache/"
        ".DS_Store"
        ".idea/"
        "*.swp"
        "built-in-stubs.jar"
        "dumb.rdb"
        ".elixir_ls/"
        ".vscode/"
        "npm-debug.log"
        "shell.nix"
      ];

      aliases = {
        bd = "branch -D";
        br = "branch";
        cam = "commit -am";
        co = "checkout";
        cb = "checkout -b";
        cm = "commit -m";
        d = "diff";
        s = "status";
        pr = "pull --rebase";
        st = "stash";
        l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
        adog = "log --all --decorate --oneline --graph";
        oops = "reset --hard";
        wipe = "commit -s";
      };

      # Global Git config
      extraConfig = {
        core = {
          editor = "nvim";
          whitespace = "trailing-space,space-before-tab";
        };
        pull.rebase = "true";
      };
    };
  };
}