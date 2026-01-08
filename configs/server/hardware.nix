{ ... }:
{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.initrd.availableKernelModules = [
    "ahci"
    "xhci_pci"
    "virtio_pci"
    "virtio_scsi"
    "virtio_blk"
    "sd_mod"
    "sr_mod"
  ];

  boot.kernelParams = [ "console=ttyS0,115200n8" ];
  boot.extraModulePackages = [ ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
    devices = [ "/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_102062030" ];
  };

  networking.hostName = config.hostInfos.name;
  networking.useDHCP = lib.mkDefault true;
  networking.useNetworkd = true;
  networking.networkmanager.enable = false;

  services.qemuGuest.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault config.hostInfos.architecture;
  system.stateVersion = config.hostInfos.stateVersion;
}
