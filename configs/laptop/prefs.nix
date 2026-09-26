{ ... }:
{
  imports = [
    ../../common/theming.nix
    ../../common/wireguard.nix
  ];

  hostPrefs = {
    mainUser = "trivaris";
    enableFingerPrintAuth = true;
    steam.enable = true;
    openssh.enable = true;
    
    # openconnectClient = {
    #   enable = true;
    #   user = "tj93wefe";
    #   gateway = "vpn.hrz.tu-darmstadt.de";
    #   cafile = pkgs.fetchurl {
    #     url = "https://raw.githubusercontent.com/Trivaris/TrivnixConfigs/44c7c084c770aa79dcdc614dcf6c0a3699004f50/resources/openconnectCerts/rootcert-tuda.crt";
    #     hash = "sha256-keL1eI1YEOunulhzfeFUio7KzQFFmLwLFD4EGxcFJVI=";
    #   };
    #   authgroup = "campus";
    # };
  };
}
