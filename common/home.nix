{ pkgs, ... }:
{

  programs = {
    btop.enable = true;
    spotify-player.enable = true;
    vesktop.enable = true;
  };

  home.packages = [
    pkgs.rsclock
    pkgs.pipes-rs
    pkgs.cmatrix
    pkgs.bonsai
    pkgs.hardinfo2
    pkgs.proton-vpn
    pkgs.bitwarden-desktop
    pkgs.signal-desktop
    pkgs.vscode
    pkgs.localsend
    pkgs.tdf
    pkgs.affine
    pkgs.wl-clipboard-rs
    pkgs.android-tools
  ];

  userPrefs.librewolf = {
    enable = true;
    allowedCookies = [
      "https://www.instagram.com"
      "https://chatgpt.com"
      "https://www.notion.so"
      "https://web.whatsapp.com"
      "https://www.kenmei.co"
      "https://mangadex.org"
      "https://auth.mangadex.org"
      "https://www.youtube.com"
      "https://www.livechart.me"
      "https://kenmei.pages.dev"

      "https://tucan.tu-darmstadt.de"
      "https://www.tucan.tu-darmstadt.de"
      "https://login.tu-darmstadt.de"
      "https://moodle.tu-darmstadt.de"
      "https://moodle.informatik.tu-darmstadt.de"
      "https://tu-darmstadt.de"
      "https://www.tu-darmstadt.de"
      "https://idm.tu-darmstadt.de"
      "https://login.hrz.tu-darmstadt.de"

      "https://github.com"
      "https://gitlab.com"
      "https://asuracomic.net"
      "https://www.reddit.com"
      "https://www.google.com"
      "https://accounts.google.com"

      "https://vault.trivaris.org"
      "https://git.trivaris.org"
      "https://affine.trivaris.org"
    ];
  };
}
