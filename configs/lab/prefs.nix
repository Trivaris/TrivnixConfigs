{ common, ... }:
{
  inherit (common.host) stylix;
  openssh.enable = true;
  autoUpgrade.enable = true;
}
