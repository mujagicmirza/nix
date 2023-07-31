{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;


    shellAliases = {
      ll = "ls -l";
      copy = "xclip -sel c";
      update = "sudo nixos-rebuild switch";
      check = "yarn nx run-many --target=lint --all && yarn nx run-many --target=tsc --all && yarn nx run-many --target=test --all &&  yarn nx run-many --target=build --all";
      serve = "yarn nx run-many --target=serve --projects=admin,server";
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
