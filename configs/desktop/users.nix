{ lib, ... }:
{
  home-manager.sharedModules = [
    (
      { ... }:
      {
        imports = [
          ../../common/home.nix
          ../../common/git.nix
        ];
      }
    )
  ];

  home-manager.users.trivaris.config = {
    userInfos = {
      name = "trivaris";
      hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
      uid = 1000;
    };

    userPrefs = {
      thunderbird.enable = true;
      prismlauncher.enable = true;
      email.enable = true;
      cli.enable = true;
      wayvnc.enable = true;
      jetbrainsIDEs = [ "idea" ];
    };
  };
}
