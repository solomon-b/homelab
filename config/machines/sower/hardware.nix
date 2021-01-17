{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/0f60c776-8ca4-4c8e-9d5b-4e4390715e3f";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/C059-DCF4";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/32c0f0e5-2e06-4a38-8739-d107a95d53f3"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  # nix.buildCores = ???
  # nix.maxJobs = lib.mkDefault ???

  networking = {
    wireless.enable = true;
    interfaces.eno1.useDHCP = true;
    interfaces.wlp1s0.ipv4.addresses = [{ address = "192.168.0.3"; prefixLength = 24; }];
    defaultGateway = "192.168.0.1";
    nameservers = [ "8.8.8.8" ];
  };
}
