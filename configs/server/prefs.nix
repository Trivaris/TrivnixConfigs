{ lib, ... }:
{
  imports = [
    ../../common/theming.nix
  ];

  hostPrefs = {
    openssh.enable = true;
    # glances.enable = true;
    headless = true;

    # ipsecServer = {
    #   enable = true;
    #   domain = "vpn.trivaris.org";
    #   cert = ../../resources/ipsecCerts/server-cert.pem;
    #   caCert = ../../resources/ipsecCerts/ca-cert.pem;
    #   clientCerts.fritzbox = ../../resources/ipsecCerts/fritzbox-cert.pem;
    #   fullchain = ../../resources/ipsecCerts/server.fullchain.pem;
    # };

    reverseProxy = {
      enable = true;
      email = "cloudflare@tripple.lurdane.de";
      zone = "trivaris.org";
    };

    tandoor = {
      enable = true;
      reverseProxy = {
        enable = true;
        domain = "tandoor.trivaris.org";
      };
    };

    cfddns = {
      enable = true;
      reverseProxy = {
        enable = true;
        domain = "cfddns.trivaris.org";
      };
    };

    collabora = {
      enable = true;
      nextcloudFQDNs = [ "cloud.joneit.net" ];
      reverseProxy = {
        enable = true;
        domain = "collabora.trivaris.org";
      };
    };

    # forgejo = {
    #   enable = true;
    #   sendMails = true;
    #   reverseProxy = {
    #     enable = true;
    #     domain = "git.trivaris.org";
    #   };
    # };

    vaultwarden = {
      enable = true;
      sendMails = true;
      reverseProxy = {
        enable = true;
        domain = "vault.trivaris.org";
      };
    };

    mailserver = {
      enable = true;
      enableIpV6 = true;
      ipV6Address = "2a01:4f8:c012:5e87::1";
      ipV6Interface = "enp1s0";
      baseDomain = "trivaris.org";
      domain = "mail.trivaris.org";
      providerName = "Trivaris Mail";
      loginAccounts."mail@trivaris.org" = {
        name = "mail@trivaris.org";
        hashedPassword = "$2b$05$7p74qoLRa2R09CJwkkL8MeKqM3oOfC4rgb0R.K1jQlO2TWpj9E3Fe";
        aliases = [
          "@mail.trivaris.org"
          "@trivaris.org"
        ];
      };
    };
  };
}
