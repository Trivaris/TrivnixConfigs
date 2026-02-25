{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  services = {
    thermald.enable = true;
    power-profiles-daemon.enable = false;
    
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
          energy_performance_preference = "power";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };

    system76-scheduler.settings.cfsProfiles.enable = true;
  };

  boot = {
    kernelModules = [ "kvm-amd" ];
    
    kernelParams = [
      "amd_pstate=active"
      "nvme.noacpi=1"
      "ahci.mobile_lpm_policy=3"
      "rtc_cmos.use_acpi_alarm=1"
    ];

    extraModprobeConfig = ''
      options rtw89_pci disable_aspm=n
      options rtw89_core disable_ps_mode=n
    '';

    blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];

    initrd.availableKernelModules = [
      "nvme" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"
    ];
    
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  networking = {
    hostName = config.hostInfos.name;
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };

  nixpkgs.hostPlatform = lib.mkDefault config.hostInfos.architecture;
  system.stateVersion = config.hostInfos.stateVersion;
}