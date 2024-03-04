{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g default-terminal screen-256color
      set -g mouse on
      
      set -g base-index 1
      setw -g pane-base-index 1

      bind | split-window -hc "#{pane_current_path}"
      bind - split-window -vc "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      bind-key -n MouseDrag1Status swap-window -t=
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      gruvbox
      yank
    ];

    shell = "${pkgs.zsh}/bin/zsh";
  };
}
