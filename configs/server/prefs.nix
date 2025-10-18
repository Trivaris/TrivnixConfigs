{ common, lib, ... }:
{
  inherit (common.host) stylix;
  openssh.enable = true;
  autoUpgrade.enable = true;
  glances.enable = true;

  ipsec = {
    enable = true;
    domain = "vpn.trivaris.org";
  };

  reverseProxy = {
    enable = true;
    email = "cloudflare@tripple.lurdane.de";
    zone = "trivaris.org";
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
      domain = "dash.trivaris.org";
    };

    settings = {
      favicon = lib.mkStorePath "resources/icons/nixowos.svg";
      color = "gray";

      layout = [
        {
          Glances = {
            header = false;
            style = "row";
            columns = 4;
          };
        }
      ];

      background = {
        image = lib.mkStorePath "resources/wallpapers/nix3.png";
        blur = "sm";
        saturate = 100;
        brightness = 100;
        opacity = 50;
      };
    };

    serviceGroups = [
      {
        Glances =
          let
            port = "61208";
          in
          [
            {
              Info = {
                widget = {
                  type = "glances";
                  url = "http://localhost:${port}";
                  metric = "info";
                  version = 4;
                };
              };
            }
            {
              Processes = {
                widget = {
                  type = "glances";
                  url = "http://localhost:${port}";
                  metric = "process";
                  version = 4;
                };
              };
            }
            {
              Disk = {
                widget = {
                  type = "glances";
                  url = "http://localhost:${port}";
                  metric = "disk:sda3";
                  version = 4;
                };
              };
            }
          ];
      }
      {
        Services = [
          {
            Forgejo = {
              description = "Personal Git Forge";
              href = "https://git.trivaris.org";
              icon = "gitea.svg";
            };
          }
          {
            Vaultwarden = {
              description = "Personal Password Manager";
              href = "https://vault.trivaris.org";
              icon = "vaultwarden.svg";
            };
          }
        ];
      }
    ];

    widgets = [
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
