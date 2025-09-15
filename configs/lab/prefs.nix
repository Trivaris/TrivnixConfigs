{ common, ... }:
{
  inherit (common) stylix;
  openssh.enable = true;
  autoUpgrade.enable = true;

  # reverseProxy = {
  #   enable = true;
  #   email = "cloudflare@tripple.lurdane.de";
  #   zone = "trivaris.org";
  #   port = 25588;
  #   ddnsTime = "04:15";
  #   extraDomains = [
  #     "minecraft.trivaris.org"
  #   ];
  # };
  # 
  # minecraftServer = {
  #   enable = false;
  #   modpack = "risingLegends";
  #   serverIcon = trivnixLib.mkStorePath "resources/icons/minecraftServer.png";
  #   reverseProxy = {
  #     enable = true;
  #     domain = "minecraft.trivaris.org";
  #   };
  # };
}
