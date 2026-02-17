{ ... }:
{
  hostPrefs.homepage = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "dash.trivaris.org";
    };

    settings = {
      favicon = ../../resources/icons/nixowos.svg;
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
        image = ../../resources/wallpapers/nix3.png;
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
}