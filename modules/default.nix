{ ... }:

{
  imports = [
    ./nixos/xserver.nix
    ./nixos/network-interfaces.nix
    # ./nixos/powerpanel.nix # Ask Connor
    # ./nixos/preLVMTempMount.nix # Is this temp fs related?
    # ./nixos/primary-user.nix # Is this all home manager related?
    # ./nixos/secure.nix # Is this for disk encryption?
    # ./nixos/sudo-cmds.nix
  ];
}
