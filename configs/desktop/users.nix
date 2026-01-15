{ common, ... }:
{
  trivaris = {
    infos = {
      name = "trivaris";
      hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
      uid = 1000;
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

      thunderbird.enable = true;
      prismlauncher.enable = true;
      email.enable = true;
      cli.enable = true;
      wayvnc.enable = true;
      desktopEnvironment = "hyprland";
      waybar.weatherLocation = "darmstadt";
      jetbrainsIDEs = [ "idea" ];
    };
  };
}
