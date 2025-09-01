common:
{
  bluetooth.enable = true;
  openssh.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  
  sunshine = {
    enable = true;
    reverseProxy.domain = "sunshine.trivaris.org";
  };

  inherit (common) stylix displayManager desktopEnvironment;
}