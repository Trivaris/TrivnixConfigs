{ pkgs, ... }:
{
  themingPrefs = {
    darkmode = true;
    schemes.general = "catppuccin-frappe";
    font = {
      package = pkgs.nerd-fonts.roboto-mono;
      name = "RobotoMono Nerd";
    };
  };
}
