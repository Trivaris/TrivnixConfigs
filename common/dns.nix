{
  ...
}:
{
  services.resolved = {
    enable = true;
    dnsLink = "systemd-resolved";
    
    extraConfig = ''
      DNS=188.34.182.1#pihole.trivaris.org
      DNSOverTLS=yes
    '';
  };
}