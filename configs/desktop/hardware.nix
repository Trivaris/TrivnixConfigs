{ ... }:
{
  config,
  lib,
  modulesPath,
  hostInfos,
  pkgs,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  environment.systemPackages = [ pkgs.ntfs-3g ];
  nixpkgs.hostPlatform = lib.mkDefault hostInfos.architecture;
  system.stateVersion = hostInfos.stateVersion;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot = {
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    supportedFileSystems.ntfs = true;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
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
    hostName = hostInfos.name;
    networkmanager.enable = true;
    interfaces.eno1.wakeOnLan.enable = true;
  };

  hardware = {
    graphics.enable = true;
    uinput.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      open = true;
    };
  };

  services = {
    xserver.videoDrivers = [ "nvidia" ];

    udev.extraRules = ''
      KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
      KERNEL=="event*", SUBSYSTEM=="input", GROUP="input", MODE="0660"
    '';
  };
}
