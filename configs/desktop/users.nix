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
        misc
        shell
        terminalEmulator
        ;

      desktopEnvironment = "hyprland";
      thunderbird.enable = true;
      waybar.weatherLocation = "darmstadt";
      hyprland.wallpapers = [ (lib.mkStorePath "resources/wallpapers/nix2.png") ];
      email.enable = true;

      jetbrainsIDEs = [
        "rust-rover"
        "idea-ultimate"
      ];

    };
  };
}
