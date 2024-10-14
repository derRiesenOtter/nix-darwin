{
  description = "Robins-Macbook-Pro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [ 
      ];

      homebrew = {
        enable = true;
        casks = [
          "wezterm"
          "clipgrab"
        ];
        masApps = {
          "Final Cut Pro" = 424389933;
          "Logic Pro" = 634148309;
        };
        onActivation.cleanup = "zap";
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      system.defaults = {
        dock.autohide = true;
        finder = {
          FXDefaultSearchScope = "SCcf";
          FXPreferredViewStyle = "Nlsv";
          ShowPathbar = true;
        };
        NSGlobalDomain.AppleWindowTabbingMode = "always";
      };

      fonts.packages = [
        pkgs.meslo-lgs-nf
      ];
      
    };
in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Robins-MacBook-Pro
    darwinConfigurations."Robins-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ 
          configuration 
	  nix-homebrew.darwinModules.nix-homebrew
	  {
          nix-homebrew = {
            enable = true;
            # Apple Silicon Only
            enableRosetta = false;
            # User owning the Homebrew prefix
            user = "robin";

            autoMigrate = true;
          };}
	
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Robins-MacBook-Pro".pkgs;
  };
}
