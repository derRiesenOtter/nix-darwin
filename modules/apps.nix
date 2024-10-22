{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
  ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [
      "homebrew/services"
    ];

    brews =
      [
      ];

    casks = [
      "wezterm"
      "clipgrab"
      "syntax-highlight"
      "zotero"
    ];
    masApps = {
      "Final Cut Pro" = 424389933;
      "Logic Pro" = 634148309;
    };
  };
}
