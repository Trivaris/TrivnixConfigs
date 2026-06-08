{
  ...
}:
{
  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNS = "188.34.182.1#pihole.trivaris.org";
        DNSOverTLS = "yes";
      };
    };
  };
}