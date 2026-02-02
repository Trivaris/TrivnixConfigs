{
  description = "Trivnix Prefs and Configurations";

  inputs.trivnix.url = "git+ssh://git@github.com/Trivaris/Trivnix";
  inputs.trivnixLib.url = "git+ssh://git@github.com/Trivaris/Trivnixlib";
  inputs.trivnixPrivate.url = "git+ssh://git@github.com/Trivaris/TrivnixPrivate";
  inputs.trivnixOverlays.url = "git+ssh://git@github.com/Trivaris/TrivnixOverlays";
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.importTree.url = "github:vic/import-tree";

  outputs = { self, trivnix, trivnixLib, nixpkgs, home-manager, importTree, trivnixPrivate, trivnixOverlays }: {
    nixosConfigurations = nixpkgs.lib.mapAttrs (configname: _: nixpkgs.lib.nixosSystem {
      specialArgs.lib = (import nixpkgs {
        system = "x86_64-linux";
        overlays = (builtins.attrValues trivnix.overlays) ++ [
          trivnixLib.overlays.default
          trivnixOverlays.overlays.default
        ];
        
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
          permittedInsecurePackages = [ "libsoup-2.74.3" ];
        };
      }).lib;
      
      modules = [
        trivnix.nixosModules.default
        trivnix.nixosModules.dependencies
        trivnixLib.nixosModules.default
        trivnixPrivate.nixosModules.default
        home-manager.nixosModules.home-manager
        (importTree (./configs + "/${configname}"))
        ({ ... }: {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "${toString self.lastModified}-backup";
            sharedModules = [
              trivnix.homeModules.default
              trivnix.homeModules.dependencies
              trivnixLib.homeModules.default
              trivnixPrivate.homeModules.default
            ];
          };
        })
        ({ ... }: {
          nixpkgs = {
            overlays = (builtins.attrValues trivnix.overlays) ++ [
              trivnixLib.overlays.default
              trivnixOverlays.overlays.default
            ];
            
            config = {
              allowUnfree = true;
              android_sdk.accept_license = true;
              permittedInsecurePackages = [ "libsoup-2.74.3" ];
            };
          };
        })
      ];
    }) (builtins.readDir ./configs);
  };
}
