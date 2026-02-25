{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  environment.systemPackages = [ pkgs.ntfs3g ];
  nixpkgs.hostPlatform = lib.mkDefault config.hostInfos.architecture;
  system.stateVersion = config.hostInfos.stateVersion;

  boot = {
    kernelModules = [
      "kvm-amd"
      "uinput"
    ];
    kernelParams = [ "nvidia-drm.modeset=1" ];
    extraModulePackages = [ ];

    loader = {
      systemd-boot.enable = true;
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
      ];
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
    '';
  };

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-id/nvme-eui.000000000000000100a07521311ee292-part2";
    fsType = "ntfs-3g";
    options = [
      "nofail"
      "uid=1000"
      "gid=100"
      "umask=007"
      "dmask=007"
    ];
  };
}
