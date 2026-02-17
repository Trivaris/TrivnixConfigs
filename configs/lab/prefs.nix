{ lib, ... }:
{
  imports = [
    ../../common/theming.nix
  ];

  hostPrefs = {
    openssh.enable = true;
    headless = true;
  };
}
