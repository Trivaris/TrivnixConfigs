{ common, lib, ... }:
{
  trivaris = {
    infos.hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
    prefs = {
      inherit (common.home)
        adbAutoPlayer
        appLauncher
        browsers
        git
        librewolf
        misc
        shell
        terminalEmulator
        vscode
        ;

      thunderbird.enable = true;
      hyprland.wallpapers = [ (lib.mkStorePath "resources/wallpapers/frieren.png") ];
      email.enable = true;
      desktopEnvironment = "hyprland";
    };
  };
}
