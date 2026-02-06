{ pkgs, ... }:
{
  themingPrefs = {
    darkmode = true;
    schemeName = "catppuccin-frappe";
    themeOverrides = {
      kitty = "${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Mocha.conf";
      spicetify = {
        package = pkgs.spicePkgs.themes.catppuccin;
        scheme = "mocha";
      };
    };

    font = {
      package = pkgs.nerd-fonts.roboto-mono;
      name = "RobotoMono Nerd";
    };
  };
}
