{ ... }:
{
  imports = [
    ../../common/theming.nix
    ../../common/wireguard.nix
  ];

  services.blueman.enable = true;
  virtualisation.docker.enable = true;

  hostPrefs = {
    mainUser = "trivaris";
    enableFingerPrintAuth = true;
    steam.enable = true;
    openssh.enable = true;
  };
}
