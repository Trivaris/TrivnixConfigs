{ lib, ... }:
{
  imports = [
    (toString ../../common/theming.nix)
  ];

  hostPrefs = {
    openssh.enable = true;
    headless = true;
  };
}
