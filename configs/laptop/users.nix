{ common, lib, ... }:
{
  trivaris = {
    infos.hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
    prefs = {
      inherit (common.home)
        adbAutoPlayer
        appLauncher
        git
        librewolf
        shell
        terminalEmulator
        ;

      desktopEnvironment = "hyprland";
      waybar.weatherLocation = "darmstadt";
      thunderbird.enable = true;
      prismlauncher.enable = true;
      email.enable = true;
      cli.enable = true;
      hyprland.wallpapers = [ (lib.mkStorePath "resources/wallpapers/frieren.png") ];
      jetbrainsIDEs = [ "idea-ultimate" ];
      misc = {
        otherPrograms = common.home.misc.otherPrograms ++ [ "java" ];
        otherPackages._general = common.home.misc.otherPackages._general ++ [
          "iverilog"
          "gtkwave"
          "yosys"
          "graphviz"
          "gradle_8"
          "glib"
          "google-java-format"
        ];
      };
    };
  };
}
