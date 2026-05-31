{ pkgs, ... }:
let 
  publicKeyFile = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/Trivaris/TrivnixConfigs/44c7c084c770aa79dcdc614dcf6c0a3699004f50/resources/pubKeys/fritz.pub";
    hash = "sha256-7UUt41La03HdNZjj1iv9E0x92VG0+a15isMutwtyQeo=";
  };
in 
{
  imports = [
    ../../common/theming.nix
  ];

  hostPrefs = {
    openssh.enable = true;
    headless = true;

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

    matrix = {
      enable = true;
      reverseProxy = {
        enable = true;
        domain = "matrix.trivaris.org";
      };
    };

    affine = {
      enable = true;
      sendMails = true;
      reverseProxy = {
        enable = true;
        domain = "affine.trivaris.org";
      };
    };

    vaultwarden = {
      enable = true;
      sendMails = true;
      reverseProxy = {
        enable = true;
        domain = "vault.trivaris.org";
      };
    };

    # n8n = {
    #   enable = true;
    #   reverseProxy = {
    #     enable = true;
    #     domain = "n8n.trivaris.org";
    #   };
    # };

    # evolution = {
    #   enable = true;
    #   reverseProxy = {
    #     enable = true;
    #     domain = "evolution.trivaris.org";
    #   };
    # };

    syncthing = {
      enable = true;
      reverseProxy = {
        enable = true;
        domain = "syncthing.trivaris.org";
      };
    };

    mailserver = {
      enable = true;
      domain = "trivaris.org";
      extraDomains = [ "mail" ];
      providerName = "Trivaris Mail";
      accounts."mail@trivaris.org" = {
        hashedPassword = "$2b$05$7p74qoLRa2R09CJwkkL8MeKqM3oOfC4rgb0R.K1jQlO2TWpj9E3Fe";
        aliases = [
          "@mail.trivaris.org"
          "@trivaris.org"
        ];
      };
    };

    homeAssistant = {
      enable = true;
      extraComponents = [
        "default_config"
        "google_translate"
        "mobile_app" 
        "met"
      ];
      wireguard = {
        enable = true;
        publicKeyFile = publicKeyFile;
      };
      reverseProxy = {
        enable = true;
        domain = "home.trivaris.org";
      };
    };

    # wireguard.server = {
    #   enable = true;
    #   domain = "vpn.trivaris.org";
    # };
  };
}
