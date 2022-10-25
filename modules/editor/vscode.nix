{
  programs.vscode = {
    enable = true;
    extensions = [
      pkgs.vscode-extensions.golang.go
      pkgs.vscode-extensions.tiehuis.zig
      pkgs.vscode-extensions.bbenoist.nix
      pkgs.vscode-extensions.eamodio.gitlens
      pkgs.vscode-extensions.ms-pyright.pyright
      pkgs.vscode-extensions.bierner.emojisense
      pkgs.vscode-extensions.yzhang.markdown-all-in-one
      pkgs.vscode-extensions.arrterian.nix-env-selector
      pkgs.vscode-extensions.coenraads.bracket-pair-colorizer-2
    ];
  };
}
