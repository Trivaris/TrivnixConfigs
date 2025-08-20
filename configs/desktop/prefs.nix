common:
{
  bluetooth.enable = true;
  kde.enable = true;
  openssh.enable = true;
  printing.enable = true;
  gdm.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  
  sunshine = {
    enable = true;
    reverseProxy.domain = "sunshine.trivaris.org";
  };

  inherit (common) stylix;
}