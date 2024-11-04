{ pkgs, ... }:

{
  system.stateVersion = 5;

  system = {
    defaults = {
      dock.autohide = true;
      finder = {
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
      };
      NSGlobalDomain = {
        AppleWindowTabbingMode = "always";
        AppleInterfaceStyle = "Dark";
        AppleInterfaceStyleSwitchesAutomatically = false;
      };
    };
  };

  fonts.packages = [
    pkgs.meslo-lgs-nf
  ];

  security.pam.enableSudoTouchIdAuth = true;

}
