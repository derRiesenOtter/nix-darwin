{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
  ];

  programs.zsh.enable = true;

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
      "nextcloud"
      "brave-browser"
      "obsidian"
      "logseq"
    ];
    masApps = {
      "Final Cut Pro" = 424389933;
      "Logic Pro" = 634148309;
      "Affinity Photo" = 824183456;
    };
  };
}
