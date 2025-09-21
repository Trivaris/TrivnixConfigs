{ common, trivnixLib, ... }:
{
  trivaris = {
    infos.hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
    prefs = {
      inherit (common)
        browsers
        appLauncher
        librewolf
        gui
        cli
        terminalEmulator
        shell
        git
        ;

      enableRandomStuff = true;
      lutris.enable = true;
      vscodium.enableLsp = true;
      desktopEnvironment = "hyprland";
      hyprland.wallpapers = [ (trivnixLib.mkStorePath "resources/wallpapers/nix2.png") ];

      jetbrainsIDEs = [
        "rust-rover"
        "idea-ultimate"
      ];

      email = {
        enable = true;
        exclude = [ "personal" ];
      };
    };
  };
}
