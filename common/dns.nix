{
  ...
}:
{
  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNS = "1.1.1.3#family.cloudflare-dns.com 1.0.0.3#family.cloudflare-dns.com";
        DNSOverTLS = "yes";
      };
    };
  };
}