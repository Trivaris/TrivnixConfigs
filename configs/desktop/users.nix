{ common, lib, ... }:
{
  trivaris = {
    infos.hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
    prefs = {
      inherit (common.home)
        browsers
        appLauncher
        librewolf
        terminalEmulator
        shell
        git
        misc
        ;

      vscodium.enableLsp = true;
      desktopEnvironment = "hyprland";
      hyprland.wallpapers = [ (lib.mkStorePath "resources/wallpapers/nix2.png") ];

      jetbrainsIDEs = [
        "rust-rover"
        "idea-ultimate"
      ];

      email = {
        enable = true;
        exclude = [ ];
      };
    };
  };
}
