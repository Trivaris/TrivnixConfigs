{ lib, config, ... }:
let
  localPeer = config.private.wgPeers.hosts.${config.hostInfos.configname};
  serverPeer = config.private.wgPeers.hosts.server;
in
{
  hostPrefs.wireguard = {
    enable = true;
    address = "10.0.0.${toString localPeer.id}/32";
    peers = [{
      publicKey = lib.removeSuffix "\n" (builtins.readFile serverPeer.key);
      allowedIPs = [ "10.0.0.${toString serverPeer.id}/32" ];
      endpoint = serverPeer.endpoint;
    }];
  };
}