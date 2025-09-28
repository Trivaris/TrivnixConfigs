{
  description = "Trivnix Prefs and Configurations";

  inputs.trivnixLib.url = "github:Trivaris/TrivnixLib";

  outputs =
    { self, trivnixLib, ... }:
    let
      inherit (builtins)
        filter
        readDir
        attrNames
        listToAttrs
        ;

      lib = trivnixLib.lib.for { selfArg = self; };
      common = import ./common.nix;

      configs = filter (name: ((readDir ./configs).${name} == "directory")) (
        attrNames (readDir ./configs)
      );

      mkConfig =
        configname:
        let
          parts = lib.resolveDir {
            dirPath = ./configs/${configname};
            flags = [
              "onlyNixFiles"
              "stripNixSuffix"
              "mapImports"
            ];
          };
        in
        listToAttrs (
          map (name: {
            inherit name;
            value = parts.${name} { inherit common lib; };
          }) (attrNames parts)
        );
    in
    {
      configs = listToAttrs (
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
