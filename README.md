# Installation of nix darwin

1. Follow the official installation instruction for the nix package manager https://nixos.org/download/
2. Get this configuration file
nix run nix-darwin -- --flake github:my-user/my-repo#my-config

# Updating of nix darwin
## Updating the configuration
```sh
darwin-rebuild switch --flake
```

