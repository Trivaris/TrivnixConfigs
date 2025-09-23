{ common, ... }:
{
  inherit (common.host) stylix;
  openssh.enable = true;
  autoUpgrade.enable = true;
  glances.enable = true;

  reverseProxy = {
    enable = true;
    email = "cloudflare@tripple.lurdane.de";
    zone = "trivaris.org";
  };

  forgejo = {
    enable = true;
    sendMails = true;
    reverseProxy = {
      enable = true;
      domain = "git.trivaris.org";
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

  homepage = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "home.trivaris.org";
    };

    services = [
      {
        Services = [
          {
            forgejo = {
              description = "Personal Git Forge";
              href = "https://git.trivaris.org";
            };

            vaultwarden = {
              description = "Personal Password Manager";
              href = "https://vault.trivaris.org";
            };
          }
        ];
      }
    ];

    widgets = [
      {
        "CPU Usage" = {
          type = "glances";
          url = "http://127.0.0.1:61208";
          metric = "cpu";
        };
      }
      {
        "Network Usage" = {
          type = "glances";
          url = "http://127.0.0.1:61208";
          metric = "network:enp1s0";
        };
      }
      {
        openmeteo = {
          label = "Hamburg";
          latitude = "53.583076";
          longitude = "10.082634";
          timezone = "Europe/Berlin";
          units = "metric";
          cache = "5";
        };
      }
      {
        datetime = {
          locale = "de";
          format = {
            dateStyle = "long";
            timeStyle = "long";
          };
        };
      }
      {
        search = {
          provider = "brave";
          showSearchSuggestions = "true";
          suggestionUrl = "https://search.brave.com/api/suggest?q=";
          target = "_blank";

        };
      }
    ];
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
}
