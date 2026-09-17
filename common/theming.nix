{ pkgs, ... }:
{
  programs.dconf.enable = true;

  themingPrefs = {
    darkmode = true;
    # schemeName = "catppuccin-frappe";
    scheme = {
      base00 = "#292727";
      base01 = "#353232";
      base02 = "#554B54";
      base03 = "#A3A187";
      base04 = "#B7AAA3";
      base05 = "#D8CFC4";
      base06 = "#E9DFD0";
      base07 = "#E9DFD0";
      base08 = "#E36A5B";
      base09 = "#D29A69";
      base0A = "#D1B078";
      base0B = "#65AA88";
      base0C = "#45A39E";
      base0D = "#5B93BC";
      base0E = "#C58F9D";
      base0F = "#B28A75";
    };
    
    themeOverrides = {
      # kitty = "${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Mocha.conf";
      # spicetify = {
      #   package = pkgs.spicePkgs.themes.catppuccin;
      #   scheme = "mocha";
      # };
    };

    font = {
      package = pkgs.nerd-fonts.adwaita-mono;
      monoName = "AdwaitaMono Nerd Font Mono";
      propoName = "AdwaitaMono Nerd Font Propo";
      extraFonts = [
        pkgs.noto-fonts
      ];
    };
  };
}
