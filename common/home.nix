{ ... }:
{
  userPrefs = {
    misc = {
      otherPrograms = [
        "btop"
        "spotify-player"
        "vesktop"
        "java"
      ];

      otherPackages = {
        _general = [
          "android-tools"
          "rsclock"
          "pipes-rs"
          "r-matrix"
          "rbonsai"
          "me3"
          "hardinfo2"
          "protonvpn-gui"
          "vlc"
          "wayland-utils"
          "wl-clipboard-rs"
          "bitwarden-desktop"
          "lutris"
          "moonlight-qt"
          "signal-desktop-bin"
          "vscode"
          "localsend"

          # System Verilog
          "iverilog"
          "gtkwave"
          "yosys"
          "graphviz"

          # Java
          "gradle_8"
          "glib"
          "google-java-format"

          # Rust
          "cargo"
          "rustc"
          "rustfmt"
          "clippy"
          "rust-analyzer"
          "gcc"
        ];

        kdePackages = [
          "kcalc"
          "dolphin"
          "ark"
          "gwenview"
        ];
      };
    };

    librewolf = {
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
        "https://f95zone.to/"

        "https://vault.trivaris.org"
        "https://git.trivaris.org"
      ];
    };
  };
}
