{
    description = "Main Flake";
    inputs = {
        # Where we get most of our software. Giant mono repo with recipes
        # called derivations that say how to build software.
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

        # Manages configs links things into your home directory
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        # Controls system level software and settings including fonts
        darwin.url = "github:LnL7/nix-darwin/master";
        darwin.inputs.nixpkgs.follows = "nixpkgs";     
    };
    outputs = inputs@{ nixpkgs, home-manager, darwin, ...}: {
        darwinConfigurations."joes-MacBook-Pro" = darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            pkgs = import nixpkgs { system = "aarch64-darwin"; config.allowUnfree = true; };
            modules = [
                ./modules/darwin
                home-manager.darwinModules.home-manager {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.joe.imports = [ ./modules/home-manager ];
                    };
                }
            ];
        };
    };
}
