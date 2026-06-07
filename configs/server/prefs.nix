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

    wireguard = {
      enable = true;
      publicKeyFile = publicKeyFile;
    };

    tandoor = {
      enable = true;
      reverseProxy = {
        enable = true;
        domain = "tandoor.trivaris.org";
        port = 8099;
      };
    };

    cfddns = {
      enable = true;
      reverseProxy = {
        enable = true;
        domain = "cfddns.trivaris.org";
        port = 8892;
      };
    };

    collabora = {
      enable = true;
      nextcloudFQDNs = [ "cloud.joneit.net" ];
      reverseProxy = {
        enable = true;
        domain = "collabora.trivaris.org";
        port = 9980;
      };
    };

    vaultwarden = {
      enable = true;
      sendMails = true;
      reverseProxy = {
        enable = true;
        domain = "vault.trivaris.org";
        port = 8891;
      };
    };

    paperless = {
      enable = true;
      reverseProxy = {
        enable = true;
        domain = "paperless.trivaris.org";
        port = 28981;
      };
    };

    syncthing = {
      enable = true;
      reverseProxy = {
        enable = true;
        domain = "syncthing.trivaris.org";
        port = 8384;
      };
    };

    piHole = {
      enable = true;
      reverseProxy = {
        enable = true;
        domain = "pihole.trivaris.org";
        port = 8895;
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
      
      reverseProxy = {
        enable = true;
        domain = "home.trivaris.org";
        port = 8123;
      };
    };

    # matrix = {
    #   enable = true;
    #   reverseProxy = {
    #     enable = true;
    #     domain = "matrix.trivaris.org";
    #     port = 6167;
    #   };
    # };

    # affine = {
    #   enable = true;
    #   sendMails = true;
    #   reverseProxy = {
    #     enable = true;
    #     domain = "affine.trivaris.org";
    #     port = 3010;
    #   };
    # };

    # n8n = {
    #   enable = true;
    #   reverseProxy = {
    #     enable = true;
    #     domain = "n8n.trivaris.org";
    #     port = 5678;
    #   };
    # };

    # evolution = {
    #   enable = true;
    #   reverseProxy = {
    #     enable = true;
    #     domain = "evolution.trivaris.org";
    #     port = 8079;
    #   };
    # };
  };
}
