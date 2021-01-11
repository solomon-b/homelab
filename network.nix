let
  machineDir = ./config/machines;

  mkMachine = targetHost: { config, ... }: {
    deployment = {
      inherit targetHost;
      #targetUser = 'solomon';
      #sshOptions = [ "-A" ];
    };
    imports = [ "${toString machineDir}/${targetHost}" ];
  };

  all-machines =
    builtins.mapAttrs
      (machine: _: mkMachine machine)
      (builtins.readDir machineDir);
in
all-machines // {
  network.description = "Homelab";
}
