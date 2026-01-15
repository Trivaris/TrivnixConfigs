{ common, ... }:
{
  trivaris = {
    infos = {
      name = "trivaris";
      hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
      uid = 1000;
    };

    prefs = {
      inherit (common.home) shell git;
      cli.enable = true;
    };
  };
}
