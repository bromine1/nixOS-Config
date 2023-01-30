{ config, lib, pkgs, user, ... }:
{
  imports = [


  ];
  home = {
    username = "ryan";
    homeDirectory = "/home/ryan";

    packages = with pkgs; [
      gh
      neovim
      git
      steam
      bat
      exa
      zellij
      coreutils
      fish
    ];

  };
}

