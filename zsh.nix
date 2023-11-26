{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    initExtra = ''
      PATH=$PATH:~/Scripts
    '';

    shellAliases = {
      ll = "ls -l";
      copy = "xclip -sel c";
      update = "sudo nixos-rebuild switch";
      check = "yarn nx run-many --target=lint --all && yarn nx run-many --target=tsc --all && yarn nx run-many --target=test --all &&  yarn nx run-many --target=build --all";
      checkFull = "yarn nx run-many --target=lint --all --skip-nx-cache && yarn nx run-many --target=tsc --all  --skip-nx-cache && yarn nx run-many --target=test --all  --skip-nx-cache &&  yarn nx run-many --target=build --all --skip-nx-cache";
      serve = "yarn nx run-many --target=serve --projects=admin,server";
      hm = "nvim --cmd 'cd ~/.config/home-manager | e home.nix'";
      cwd = "cd $(cat ~/.cwd)";
      mwd = "echo $(pwd) > ~/.cwd";
      rmContainers = "docker ps -a | sed '1d' | awk '{print $1}' | xargs -L1 -i sh -c \"docker stop {}; docker rm {}\"";
      rmVolumes = "docker volume ls | sed '1d' | awk '{print $2}' | xargs -L1 -i sh -c \"docker volume rm {}\"";
    };

    history = {
      size = 10000;
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };
}
