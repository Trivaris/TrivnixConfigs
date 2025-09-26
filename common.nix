{
  home = {
    terminalEmulator = "kitty";
    shell = "fish";
    browsers = [ "librewolf" ];
    appLauncher = "rofi";

    git = {
      email = "git@trivaris.org";
      enableSigning = true;
      urlAliases = {
        "git@github.com:Trivaris/" = "triv:";
        "git@github.com:" = "github:";
      };
    };

    librewolf = {
      betterfox = true;
      clearOnShutdown = true;
      allowedCookies = [
        "https://www.instagram.com/"
        "https://chatgpt.com/"
        "https://www.notion.so"
        "https://web.whatsapp.com/"
        "https://www.kenmei.co"
        "https://mangadex.org"
        "https://auth.mangadex.org"
        "https://www.youtube.com"
        "https://www.livechart.me"

        "https://github.com"
        "https://gitlab.com"
        "https://asuracomic.net"
        "https://www.reddit.com"
        "https://www.google.com"
        "https://accounts.google.com"
        "https://f95zone.to/"

        "https://vault.trivaris.org"
        "https://git.trivaris.org"
      ];
    };
  };

  host = {
    stylix = {
      darkmode = true;
      colorscheme = "catppuccin-frappe";
      cursorPackage = "rose-pine-cursor";
      cursorName = "BreezeX-RosePine-Linux";
      nerdfont = "code-new-roman";
    };
  };

  pkgsConfig = {
    allowUnfree = true;
    android_sdk.accept_license = true;
    permittedInsecurePackages = [ "libsoup-2.74.3" ];
  };
}
