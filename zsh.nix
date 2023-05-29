{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;


    shellAliases = {
      ll = "ls -l";
      copy = "xclip -sel c";
      hello = "echo $1";
      update = "sudo nixos-rebuild switch";
    };

    history = {
      size = 10000;
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
    };

  };
}
