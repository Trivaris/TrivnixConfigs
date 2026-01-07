{ common, ... }:
{
  trivaris = {
    infos = {
      name = "trivaris";
      hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
    };
    
    prefs = {
      inherit (common.home)
        appLauncher
        git
        librewolf
        misc
        shell
        terminalEmulator
        ;

      desktopEnvironment = "hyprland";
      waybar.weatherLocation = "darmstadt";
      thunderbird.enable = true;
      prismlauncher.enable = true;
      email.enable = true;
      cli.enable = true;
      remmina.enable = true;
      jetbrainsIDEs = [ "idea" ];
    };
  };
}
