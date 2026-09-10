{ lib, config, ... }:
let
  allPeers = config.private.wgPeers.hosts // config.private.wgPeers.guests;
  localPeer = allPeers.${config.hostInfos.configname};
  otherPeers = lib.filterAttrs (name: _: name != config.hostInfos.configname) allPeers;
in
{
  hostPrefs.wireguard = {
    enable = true;
    address = "10.0.0.${toString localPeer.id}/32";
    peers = lib.mapAttrsToList (name: peer: {
      publicKey = lib.removeSuffix "\n" (builtins.readFile peer.key);
      allowedIPs = [ "10.0.0.${toString peer.id}/32" ];
      endpoint = peer.endpoint;
    }) otherPeers;
  };
}