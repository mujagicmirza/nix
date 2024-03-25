{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    extensions = with pkgs.vscode-extensions; [
      #dracula-theme.theme-dracula
      vscodevim.vim
      #catppuccin.catppuccin-vsc
      #github.copilot
      #editorconfig.editorconfig
      #dbaeumer.vscode-eslint
      eamodio.gitlens
    ];
  };
}
