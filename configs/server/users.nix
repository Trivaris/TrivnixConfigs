{ lib, ... }:
{
  home-manager.sharedModules = [
    (
      { ... }:
      {
        imports = [ ../../common/git.nix ];
      }
    )
    (
      { config, ... }:
      {
        programs.ssh.matchBlocks."git.trivaris.org" = {
          port = 222;
          user = "git";
          identityFile = config.sops.secrets.ssh-private-key.path;
        };
      }
    )
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
