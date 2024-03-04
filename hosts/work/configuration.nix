{ config, inputs, pkgs, unstablePkgs, nodePkgs, ... }:
let
  modulesPath = ../../modules/nixos;
in
{
  imports =
    [
      ./hardware-configuration.nix
      (modulesPath + /xserver.nix)
      (modulesPath + /sound.nix)
      (modulesPath + /locale.nix)
      (modulesPath + /docker.nix)
      (modulesPath + /steam.nix)
      (modulesPath + /hyprland.nix)

      inputs.home-manager.nixosModules.default

      #(modulesPath + /nixos/vbox.nix)
      #(modulesPath + /nixos/android.nix)
    ];

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.supportedFilesystems = [ "ntfs" ];

  # Enable networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

 # Detect network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  users.users.mirza = {
    isNormalUser = true;
    description = "Mirza Mujagić";
    extraGroups = [ "networkmanager" "wheel" "docker" "adbusers" "vboxusers"];
  };

  hardware.opengl.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };  

  networking.firewall.enable = false;

  networking.extraHosts =
  ''
    127.0.0.1 dev.crm.jobstep.com
    127.0.0.1 dev.js.jobstep.com
    127.0.0.1 dev.join.jobstep.com
    127.0.0.1 dev.api.pa.jobstep.com
    127.0.0.1 dev.pma.jobstep.com
  '';

  home-manager = {
    extraSpecialArgs = { inherit inputs unstablePkgs nodePkgs; };
    users = {
      "mirza" = import ./home/home.nix;
    };
  };

  system.stateVersion = "22.11";
}
