common: {
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
        stylix
        ;

      email.enable = true;
      lutris.enable = true;
      vscodium.enableLsp = true;
      git.email = "github@tripple.lurdane.de";
    };
  };
}
