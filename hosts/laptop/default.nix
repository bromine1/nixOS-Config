{ config, pkgs, user, ... }:

{
  imports = [
    ./hardware-configuration.nix # import important autogenerated stuff
  ];

  boot = {
    #initrd.kernelModules = [ "nvidia" "nvidia_modset" "nvidia_uvm" "nvidia_drm" ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    loader.efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      #useOSProber = true; # enables dual boot;
    };

    loader.systemd-boot = { enable = false; };
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking

  # Set your time zone.

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  #Docker
  #virtualisation.docker.enable = true;
  #virtualisation.docker.storageDriver = "btrfs";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "Me!";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "plugdev" ];
    # import modules
    packages = with pkgs; [ ];
    initialPassword = "password"; # TODO fix later with sops-nix

  };

  hardware.bluetooth = { enable = true; };

  # Allow unfree packages

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  #  system.stateVersion = "22.11"; # Did you read the comment?
  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11";
  };
}
