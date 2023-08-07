{
  description = "A useful config";

  nixConfig = {
    # allow building without passing flags on first run
    extra-experimental-features = "nix-command flakes";
    # Add me to trusted users
    trusted-users = ["root" "@wheel" "ryan"];
    builders-use-substitutes = true;

    # Grab binaries faster from sources
    substituters = [
      "https://cache.nixos.org/"
      "https://hyprland.cachix.org"
      "https://prismlauncher.cachix.org"
      "https://nix-community.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://anyrun.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "prismlauncher.cachix.org-1:GhJfjdP1RFKtFSH3gXTIQCvZwsb2cioisOf91y/bK0w="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
    http-connections = 0; #No limit on number of connections

    # nix store optimizations
    auto-optimise-store = true;
    allowUnfree = true;
  };

  inputs = {
    nix-gaming.url = "github:fufexan/nix-gaming";
    fenix = {
      url = "github:nix-community/fenix";
    };

    flakeProgramsSqlite = {
      url = "github:wamserma/flake-programs-sqlite";
    };

    anyrun.url = "github:Kirottu/anyrun";

    nixpkgs.url = "nixpkgs/nixos-unstable";

    sops-nix.url = "github:Mic92/sops-nix";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.url = "nixpkgs/nixos-unstable";
    };

    prismlauncher = {
      url = "github:prismlauncher/prismlauncher";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    #Hyprland-Desktop-Portal = {
    #  url = "github:hyprwm/xdg-desktop-portal-hyprland";
    #};

    #Hyprland-Waybar = {
    #  url = "github:r-clifford/Waybar-Hyprland";
    #  #inputs.nixpkgs.follows = "nixpkgs";
    #};

    nixos-hardware = {url = "github:NixOS/nixos-hardware/master";};

    nix-colors = {url = "github:misterio77/nix-colors";};

    nil = {url = "github:oxalica/nil";};
    nixd = {url = "github:nix-community/nixd";};

    alejandra = {
      url = "github:kamadorueda/alejandra";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    fenix,
    anyrun,
    nixpkgs,
    sops-nix,
    hyprland,
    home-manager,
    nixos-hardware,
    nix-colors,
    neovim-nightly-overlay,
    alejandra,
    nix-gaming,
    prismlauncher,
    flakeProgramsSqlite,
    nil,
    #gets latest version of nil
    ...
  } @ inputs: let
    system = "x86_64-linux";

    #nixpkgs.config.allowUnfree = true;
    user = "ryan";
    overlays = [
      (_: super: let pkgs = fenix.inputs.nixpkgs.legacyPackages.${super.system}; in fenix.overlays.default pkgs pkgs)
      #neovim-nightly-overlay.overlay
      (final: prev: {
        discord = prev.discord.override {withOpenASAR = true;};
      })
    ];
  in {
    formatter.x86_64-linux = alejandra.defaultPackage.${system};
    nixosConfigurations = import ./hosts {
      inherit (nixpkgs) lib;
      inherit inputs nixpkgs hyprland nixos-hardware user self sops-nix;
      specialArgs.inputs = inputs;
    }; # Imports ./hosts/default.nix

    homeConfigurations = {
      HmInputs = overlays system alejandra neovim-nightly-overlay;
      nixpkgs.overlays = overlays;

      Nebula = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        modules = [
          ./home/home.nix
          anyrun.homeManagerModules.default
        ];

        extraSpecialArgs = {
          inherit nix-colors;
          computer = "Nebula";
          inherit overlays system inputs;
          inherit alejandra neovim-nightly-overlay nil hyprland;
        };
      };

      Galaxia = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        modules = [
          ./home/home.nix
          anyrun.homeManagerModules.default
        ];

        extraSpecialArgs = {
          inherit nix-colors;
          computer = "Galaxia";
          inherit overlays system inputs;
          inherit alejandra neovim-nightly-overlay nil hyprland;
        };
      };
    };
  };
}
