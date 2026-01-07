{ common, ... }:
{
  trivaris = {
    infos = {
      name = "trivaris";
      hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
    };
    prefs = {
      inherit (common.home) git shell terminalEmulator;
      cli.enable = true;
    };
  };
}
