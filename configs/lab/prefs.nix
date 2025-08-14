common:
{
  openssh.enable = true;

  reverseProxy = {
    enable = true;
    email = "cloudflare@tripple.lurdane.de";
    zone = "trivaris.org";
    port = 25588;
    ddnsTime = "04:15";
    extraDomains = [
      "minecraft.trivaris.org"
    ];
  };

  sunshine = {
    enable = true;
    domain = "sunshine.trivaris.org";
    hostMac = "08:bf:b8:42:59:7c";
  };

  minecraftServer = {
    enable = false;
    domain = "minecraft.trivaris.org";
    modpack = "rising-legends";
  };

  inherit (common) stylix;
}