{ pkgs, ... }: {
  # here go the darwin preferences and config items
  users.users.joe.home = "/Users/joe";
  programs.zsh.enable = true;
  environment = {
    systemPackages = [
      pkgs.coreutils
      pkgs.discord
      pkgs.slack
      pkgs.gh
    ];
    systemPath = [ "/opt/homebrew/bin" ];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  fonts.packages = [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Hack" ]; }) ];
  services.nix-daemon.enable = true;
  system.defaults = {
    NSGlobalDomain.AppleShowAllExtensions = true;
    dock.autohide = true;
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
  };
  # backwards compat; don't change
  system.stateVersion = 4;
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    onActivation.cleanup = "zap";
    taps = [
      "oven-sh/bun"
      "pkgxdev/made"
    ];
    brews = [
      "flyctl"
      "pkgxdev/made/pkgx"
      "pkgxdev/made/pkgm"
      "fzf"
      "aider"
    ];
    masApps = {
      "Amphetamine" = 937984704;
      "rcmd" = 1596283165;
      "Presentify - Screen Annotation" = 1507246666;
      "HazeOver • Distraction Dimmer" = 430798174;
      "Structured - Daily Planner" = 1499198946;
      "one sec | screen time + focus" = 1532875441;
      "Endel: Focus, Sleep, Relax" = 1346247457;
      "Photomator - Photo Editor" = 1444636541;
      "Pixelmator Pro" = 1289583905;
      "Toggl Track: Hours & Time Log" = 1291898086;
      "Portal - Immersive Escapes" = 1436994560;
      "Affinity Designer 2" = 1616831348;
      "Affinity Photo 2: Image Editor" = 1616822987;
      "Affinity Publisher 2" = 1606941598;
      "Streaks" = 963034692;
      # "Craft - Docs and Notes Editor" = 1487937127;
      # "Unsplash Wallpapers" = 1284863847;
    };
    casks = [
      "ghostty"
      "epic-games"
      "keyboard-maestro"
      "jordanbaird-ice"
      "zotero"
      "zed"
      "affine"
      "linear-linear"
      "grammarly-desktop"
      "betterdisplay"
      "heptabase"
      "1password"
      "1password-cli"
      "arc"
      "warp"
      "readdle-spark"
      "istat-menus"
      "todoist"
      "obsidian"
      "zoom"
      "cleanshot"
      "nvidia-geforce-now"
      "figma"
      "raycast"
      "steam"
      "beeper"
      "notion"
      "morgen"
      "boom-3d"
      "bettertouchtool"
      "ollama"
      "screen-studio"
      "telegram"
      "obs"
      "lulu"
      "devonthink"
      "devonagent"
      "daisydisk"
      "ubersicht"
      # "soundsource"
      # "jan"
      # "bartender"
    ];
  };
}
