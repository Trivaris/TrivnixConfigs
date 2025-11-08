{ common, ... }:
{
  inherit (common.host) stylix;
  cli.enable = true;
  openssh.enable = true;
  autoUpgrade.enable = true;
}
