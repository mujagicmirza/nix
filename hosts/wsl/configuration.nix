{ config, lib, inputs, pkgs, unstablePkgs, nodePkgs, ... }:
let
  modulesPath = ../../modules/nixos;
in
{
  imports =
    [
      (modulesPath + /locale.nix)
      inputs.home-manager.nixosModules.default
    ];

  # WSL
  wsl.enable = true;
  wsl.defaultUser = "mirza";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  # User
  users.users.mirza = {
    isNormalUser = true;
    description = "Mirza Mujagić";
    extraGroups = [ "networkmanager" "wheel" "docker" "adbusers" "vboxusers"];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs unstablePkgs nodePkgs; };
    users = {
      "mirza" = import ./home/home.nix;
    };
  };

  system.stateVersion = "23.11";
}
