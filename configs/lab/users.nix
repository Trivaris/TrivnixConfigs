{ lib, ... }:
{
  home-manager.sharedModules = [
    (toString ../../common/git.nix)
  ];
  
  home-manager.users.trivaris.config = {
    userPrefs.cli.enable = true;
    userInfos = {
      name = "trivaris";
      hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
      uid = 1000;
    };
  };
}
