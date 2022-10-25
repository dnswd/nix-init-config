{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      dotDir = "~/.config/zsh";
      # Auto suggest options and highlights syntact, searches in history for options
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      history.size = 10000;

      # Extra plugins for zsh
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "dotenv" "fzf" "z" ];
        custom = "$HOME/.config/zsh/omzsh";
      };
    };
  };
}