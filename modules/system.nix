{ pkgs, ... }:

{
  system = {
    stateVersion = 5;

    defaults = {
      dock.autohide = true;
      finder = {
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
      };
      NSGlobalDomain.AppleWindowTabbingMode = "always";
    };
  };

  fonts.packages = [
    pkgs.meslo-lgs-nf
  ];

  security.pam.enableSudoTouchIdAuth = true;

  programs.zsh.enable = true;

}
