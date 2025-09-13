{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    trivnix-lib = {
      url = "github:trivaris/trivnix-lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, trivnix-lib, ... }:
    let
      trivnixLib = trivnix-lib.lib.for self;
      common = import ./common.nix;

      configs = builtins.filter (name: ((builtins.readDir ./configs).${name} == "directory")) (
        builtins.attrNames (builtins.readDir ./configs)
      );

      mkConfig =
        configname:
        let
          parts = trivnixLib.resolveDir {
            dirPath = ./configs/${configname};
            flags = [
              "onlyNixFiles"
              "stripNixSuffix"
              "mapImports"
            ];
          };
          pubKeys = trivnixLib.resolveDir {
            dirPath = ./configs/${configname}/pubKeys;
            flags = [ "mapImports" ];
          };
        in
        parts
        // {
          inherit pubKeys;
          users = parts.users {
            inherit trivnixLib;
            common = common.user;
          };
          prefs = parts.prefs {
            inherit trivnixLib;
            common = common.host;
          };
          pkgsConfig = parts.pkgsConfig common;
        };
    in
    {
      configs = builtins.listToAttrs (
        map (configname: {
          name = configname;
          value = mkConfig configname;
        }) configs
      );

      commonInfos = {
        homeWireguardInterface = "wg1";
        homeGatewayMac = "e8:df:70:7f:01:f3";
      };
    };
}
