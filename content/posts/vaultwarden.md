---
title: "Vaultwarden"
date: "2022-10-31"
author: "9glenda"
tags:
  - nixos
  - tailscale
  - vaultwarden
description: "Setting up tailscale with vaultwarden on nixos"
readingTime: true
hideComments: true
---
# Vaultwarden on nixos with tailscale and https
Code:
```nix
{ pkgs
, config
, lib
, ...
}:
with lib;
with builtins; let
  cfg = config.sys.services;
  tskey = builtins.getEnv "key";
in
{
  config = mkIf cfg.vaultwarden {
    services.vaultwarden = {
      enable = true;
      config = {
        domain = "https://pi.tahr-cloud.ts.net";
        #domain = "https://pi.9glenda.github.beta.tailscale.net";
        signupsAllowed = true;
      };
    };
    services.caddy = {
      enable = true;
      #virtualHosts."pi.9glenda.github.beta.tailscale.net".extraConfig = ''
      virtualHosts."pi.tahr-cloud.ts.net".extraConfig = ''
        reverse_proxy http://127.0.0.1:8000
      '';
    };
  };
}
```
