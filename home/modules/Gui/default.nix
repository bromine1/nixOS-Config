{ config, lib, pkgs, user, inputs, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # Apps without Home Manager Modules
  home.packages = with pkgs; [
    # note taking
    xournalpp
    logseq

    # Gaming
    steamcmd
    steam-tui
    gamescope
    gamemode
    mesa
    dxvk
    #itch #(commented due to InsecurePackage)
    prismlauncher

    # Utilities
    cinnamon.nemo-with-extensions
    flameshot
    carla
    noisetorch
    pavucontrol
    gimp
    playerctl
    # bluetooth
    bluez
    bluez-tools
    blueberry

    # Productivity
    #libreoffice
    calibre

    # Web
    firefox-wayland

    # Media
    mpv
    imv

    #art
    pixelorama

    #Libs
    xorg.libxcb
  ];
}
