{ config, pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    # Only allow PFS-enabled ciphers with AES256
    sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";

    # Setup Nextcloud virtual host to listen on ports
    virtualHosts = {
      "yellowstone.cofree.coffee" = {
        ## Force HTTP redirect to HTTPS
        forceSSL = true;
        ## LetsEncrypt
        enableACME = true;
      };
    };
  };
}
