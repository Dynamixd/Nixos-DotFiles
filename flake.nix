{
  description = "Zachs Flake";

  inputs = {
    #    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs = {
      type = "indirect";
      id = "nixpkgs";
    };

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    nixcord.url = "github:FlameFlag/nixcord";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      nixvim,
      alejandra,
      ...
    }@inputs:
    let

      system = "x86_64-linux";
      username = "zach";
      hostname = "nixos";

    in
    {

      formatter.x86_64-linux = inputs.alejandra.packages.x86_64-linux.default;

      #overlays = import ./overlays { inherit inputs; };

      #nixosModules = import ./modules/nixos;

      #homeManagerModules = import ./modules/home-manager;

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
          };

          modules = [

            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager

            {
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit inputs;
              };

              home-manager.useGlobalPkgs = true;

              home-manager.useUserPackages = true;

              home-manager.backupFileExtension = "backup";

              home-manager.users.${username} = import ./home-manager/home.nix;
            }
          ];
        };
      };
    };
}
