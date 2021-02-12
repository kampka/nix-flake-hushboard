Hushboard - Mute your mic while you’re typing

## Setup

## Using nix flakes

There is also experimental flake support. In your `/etc/nixos/flake.nix` add the following:

```nix
{
  description = "NixOS configuration with flakes";
  inputs.hushboard.url = "github:kampka/nix-flake-hushboard";

  outputs = { self, nixpkgs, hushboard }: {
    nixosConfigurations.<your-hostname> = nixpkgs.lib.nixosSystem {
      modules = [
        hushboard.nixosModules.hushboard
      ];
    };
  };
}
```

### Using fetchGit

You can fetch the git repository directly:

```nix
let
  hushboard = import (builtins.fetchGit { url = "https://github.com/kampka/nix-flake-hushboard.git;" });
in {
  imports = [
    hushboard.module
  ];
}
```

Unlike the channel, this will update the git repository on a rebuild. However,
you can easily pin to a particular revision if you desire more stability.

