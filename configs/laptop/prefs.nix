{ pkgs, ... }:
{
  imports = [
    ../../common/theming.nix
  ];

  hostPrefs = {
    mainUser = "trivaris";
    enableFingerPrintAuth = true;
    bluetooth.enable = true;
    nmApplet.enable = true;
    printing.enable = true;
    steam.enable = true;
    kdeConnect.enable = true;
    openssh.enable = true;
    jtegranx.enable = true;
    spicetify.enable = true;
    enableDevStuffs = true;

    openconnectClient = {
      enable = true;
      user = "tj93wefe";
      gateway = "vpn.hrz.tu-darmstadt.de";
      cafile = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/Trivaris/TrivnixConfigs/refs/heads/main/resources/openconnectCerts/rootcert-tuda.crt";
        hash = "sha256-keL1eI1YEOunulhzfeFUio7KzQFFmLwLFD4EGxcFJVI=";
      };
      authgroup = "campus";
    };

    wireguard.client = {
      enable = true;
      ip = "10.100.0.7";
      serverAddress = "vpn.trivaris.org";
    };

    udev = {
      enable = true;
      rules = pkgs: ''
        ACTION=="add", SUBSYSTEM=="block", ATTRS{idProduct}=="a7e0", ATTRS{idVendor}=="11ec", ATTR{partition}=="1", SYMLINK+="switch", RUN+="${pkgs.systemd}/bin/systemd-mount --no-block --automount=yes --collect -o gid=users,fmask=113,dmask=002 /dev/%k /mnt/switch"
      '';
    };
  };
}
