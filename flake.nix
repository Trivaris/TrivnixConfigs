{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    trivnix-lib = {
      url = "github:trivaris/trivnix-lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, trivnix-lib, ... }: let
    trivnixLib = trivnix-lib.lib.for self;
    common = import ./common.nix;

    configs = builtins.filter
      (name: ((builtins.readDir ./configs).${name} == "directory"))
      (builtins.attrNames (builtins.readDir ./configs));

    mkConfig = configname:
      let
        parts = trivnixLib.resolveDir {
          dirPath = ./configs/${configname};
          mode = "imports";
          dropNixExtension = true;
        };
        pubKeys = trivnixLib.resolveDir {
          dirPath = ./configs/${configname}/pubKeys;
          mode = "imports";
          includeNonNix = true;
          depth = 3;  
        };
      in
        parts // {
          users = parts.users common.user;
          prefs = parts.prefs common.host;
          inherit pubKeys;
        };
  in {
    configs = builtins.listToAttrs (map (configname: {
      name = configname;
      value = mkConfig configname;
    }) configs);
  };
}
