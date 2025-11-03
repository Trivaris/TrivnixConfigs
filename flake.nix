{
  description = "Trivnix Prefs and Configurations";

  outputs =
    { self }:
    let
      lib.mkStorePath = path: self + (toString "/${path}");
      common = import ./common.nix;
      configs = mapToImports (builtins.readDir ./configs) ./configs;

      mapToImports =
        attrs: path:
        builtins.mapAttrs (
          name: value:
          let
            nextPath = "${path}/${name}";
          in
          if value == "directory" then mapToImports (builtins.readDir nextPath) nextPath else import nextPath
        ) attrs;

      importParts =
        parts:
        builtins.listToAttrs (
          map (name: {
            name = builtins.replaceStrings [ ".nix" ] [ "" ] name;
            value = parts.${name} { inherit common lib; };
          }) (builtins.attrNames parts)
        );
    in
    {
      configs = builtins.mapAttrs (_: parts: importParts parts) configs;

      commonInfos = {
        homeWireguardInterface = "wg1";
        homeGatewayMac = "e8:df:70:7f:01:f3";
      };
    };
}
