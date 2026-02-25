{
  description = "Zachs Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    #    nixpkgs = {
    #      type = "indirect";
    #      id = "nixpkgs";
    #    };
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    #nixpkgs-stable,
    nixpkgs-unstable,
    nixvim,
    alejandra,
    ...
  }: let
    system = "x86_64-linux";
    username = "zach";
    hostname = "nixos";
  in {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem rec {
        specialArgs = {
          inherit inputs;
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            inherit inputs;
            inherit username;
            inherit hostname;
            config.allowUnfree = true;
          };
          #            pkgs-stable = import nixpkgs {
          #  inherit system;
          #  inherit inputs;
          #  inherit username;
          #  inherit hostname;
          #  config.allowUnfree = true;
          #};
        };
        modules = [
          (
            {...}: {
              nixpkgs.config.allowUnfree = true;
            }
          )
          ./system.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit username;
              inherit inputs;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            #		  home-manager.sharedModules = [
            #		      nixvim.homeModules.nixvim
            #		  ];
            home-manager.users.${username} = import ./home.nix;
          }
        ];
      };
    };
    formatter.x86_64-linux = inputs.alejandra.packages.x86_64-linux.default;
  };
}
