{ common, ... }:
{
  openssh.enable = true;
  autoUpgrade.enable = true;
  headless = true;
}
