# Installation of nix darwin

1. Follow the official installation instruction for the nix package manager https://nixos.org/download/
3. Log in to the Mac App Store
3. Create a new [ssh-key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
4. Add the ssh-key to the [github account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
5. Copy the configuration to .config
```sh
mkdir -p ~/.config
cd ~/.config
git clone git@github.com:derRiesenOtter/nix-darwin.git
```
6. Initialize nix-darwin 
```sh 
nix run nix-darwin -- --flake ~/.config/nix-darwin#MacBookPro
```

# Updating of nix darwin
## Updating the configuration
```sh
darwin-rebuild switch --flake ~/.config/nix-darwin#MacBookPro
```

