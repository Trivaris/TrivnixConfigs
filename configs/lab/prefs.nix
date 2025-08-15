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

  minecraftServer = {
    enable = false;
    modpack = "rising-legends";
    reverseProxy = {
      enable = true;
      domain = "minecraft.trivaris.org";
    };
  };

  inherit (common) stylix;
}