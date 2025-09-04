common: {
  trivaris = {
    infos = {
      hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
    };

    prefs = {
      inherit (common) shell;
      
      git.email = "github@tripple.lurdane.de";

      extendedCli = [
        "fzf"
        "eza"
        "btop"
      ];
    };
  };
}
