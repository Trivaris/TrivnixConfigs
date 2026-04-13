{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}:
let 
  prefs = config.hostPrefs;
  mainuser = config.users.users.${prefs.mainUser};
  mainuserGroup = config.users.groups.${mainuser.group};
in 
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  environment.systemPackages = [ pkgs.ntfs3g pkgs.sshfs ];
  nixpkgs.hostPlatform = lib.mkDefault config.hostInfos.architecture;
  system.stateVersion = config.hostInfos.stateVersion;

  boot = {
    kernelModules = [
      "kvm-amd"
      "uinput"
    ];
    kernelParams = [
      "nvidia-drm.modeset=1"
      "snd_hda_intel.power_save=0"
      "snd_hda_intel.power_save_controller=N"
      "usbcore.autosuspend=-1" 
      "btusb.enable_autosuspend=n"
    ];
    extraModulePackages = [ ];

    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      supportedFilesystems.ntfs = true;
      kernelModules = [ ];
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usb_storage"
        "usbhid"
        "sd_mod"
        "btusb"
      ];
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };

  networking = {
    useDHCP = lib.mkDefault true;
    hostName = config.hostInfos.name;
    networkmanager.enable = true;
    interfaces.eno1.wakeOnLan.enable = true;
  };

  hardware = {
    uinput.enable = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [ pkgs.nvidia-vaapi-driver ];
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
    };
  };

  services = {
    xserver.videoDrivers = [ "nvidia" ];

    udev.extraRules = ''
      KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
      KERNEL=="event*", SUBSYSTEM=="input", GROUP="input", MODE="0660"
      ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0a12", ATTR{idProduct}=="0001", ATTR{authorized}="0", ATTR{authorized}="1"
    '';
  };

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-id/nvme-eui.000000000000000100a07521311ee292-part2";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "windows_names"
      "nofail"
      "uid=1000"
      "gid=100"
      "umask=007"
      "dmask=007"
    ];
  };

  fileSystems."/mnt/steamdeck" = {
    device = "deck@steamdeck.fritz.box:/home/deck";
    fsType = "fuse.sshfs";
    options = [
      "x-systemd.automount"
      "noauto"

      "_netdev"
      "reconnect"
      "ServerAliveInterval=15"

      "IdentityFile=${
        if prefs.openssh.enable then
          config.sops.secrets.ssh-host-key.path
        else
          prefs.sops.secrets.ssh-root-key.path
      }"
      "allow_other"
      "umask=000"

      "uid=${toString mainuser.uid}"
      "gid=${toString mainuserGroup.gid}"
    ];
  };

  fileSystems."/mnt/steamdeck-sdcard" = {
    device = "deck@steamdeck.fritz.box:/run/media/deck/steamdeck";
    fsType = "fuse.sshfs";
    options = [
      "x-systemd.automount"
      "noauto"

      "_netdev"
      "reconnect"
      "ServerAliveInterval=15"

      "IdentityFile=${
        if prefs.openssh.enable then
          config.sops.secrets.ssh-host-key.path
        else
          prefs.sops.secrets.ssh-root-key.path
      }"
      "allow_other"
      "umask=000"

      "uid=${toString mainuser.uid}"
      "gid=${toString mainuserGroup.gid}"
    ];
  };
}
