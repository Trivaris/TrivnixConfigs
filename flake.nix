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
      (name: ((builtins.readDir ./configs).${name} == "directory") && !(builtins.elem name [ "homeServer" ]))
      (builtins.attrNames (builtins.readDir ./configs));

    mkConfig = configname:
      let
        parts = trivnixLib.resolveDir {
          dirPath = "/configs/${configname}";
          mode = "imports";
        };
      in
        parts // {
          users = parts.users common.user;
          prefs = parts.prefs common.host;
        };
  in {
    configs = builtins.listToAttrs
      (map (configname: {
        name = configname;
        value = mkConfig configname;
      })
      configs);
  };
}
