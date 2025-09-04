common: {
  trivaris = {
    infos = {
      hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
    };

    prefs = {
      email.enable = true;
      lutris.enable = true;
      vscodium.enableLsp = true;
      fish.enable = true;

      git.email = "github@tripple.lurdane.de";

      inherit (common) librewolf gui cli terminalEmulator shell;
    };
  };
}
