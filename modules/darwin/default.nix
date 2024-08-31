{ pkgs, ...}: {
    # here go the darwin preferences and config items
    users.users.joe.home = "/Users/joe";
    programs.zsh.enable = true;
    environment = {
        systemPackages = [
            pkgs.coreutils
            pkgs.discord
            pkgs.slack
            pkgs.spotify
            ];
        systemPath = [ "/opt/homebrew/bin" ];
    };
    nix.extraOptions = ''
        experimental-features = nix-command flakes
    '';
    fonts.packages = [ (pkgs.nerdfonts.override { fonts = ["JetBrainsMono" "Hack"]; }) ];
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
        taps = [];
        brews = [
            "pipx"
            "mas"
            "ffmpeg"
        ];
        masApps = {
            "Amphetamine" = 937984704;
            "rcmd" = 1596283165;
            "Presentify - Screen Annotation" = 1507246666;
            "Streaks" = 963034692;
            "Craft - Docs and Notes Editor" = 1487937127;
            "CleanMyMac X" = 1339170533;
            "Endel: Focus, Sleep, Relax" = 1346247457;
            "Lunatask: A Better To-Do List (2.0.6)" = 1583719331;
            # "HazeOver • Distraction Dimmer" = 430798174;
            # "Photomator – Photo Editor" = 1444636541;
            # "Pixelmator Pro" = 1289583905;
            # "Things 3" = 904280696; # Using the beta one in testflight
            # "Unsplash Wallpapers" = 1284863847;
            # "Drafts" = 1435957248;
            # "Portal - Immersive Escapes" = 1436994560;
            # "Bear Markdown Notes" = 1091189122;
        };
        casks = [
            "jordanbaird-ice"
            "zotero"
            "zed"
            "soundsource"
            "copilot"
            "affine"
            "linear-linear"
            "dropbox"
            "epic-games"
            "font-hack-nerd-font"
            "messenger"
            "grammarly-desktop"
            "telegram"
            "bettertouchtool"
            "betterdisplay"
            "heptabase"
            "1password"
            "1password-cli"
            "arc"
            "warp"
            "readdle-spark"
            "istat-menus"
            "todoist"
            "devonthink"
            "devonagent"
            "obsidian"
            "zoom"
            "cleanshot"
            "nvidia-geforce-now"
            "figma"
            "raycast"
            "steam"
            "beeper"
            "notion"
            "anytype"
            "espanso"
            "cursor"
            "parallels"
            "setapp"
            # "godot"
            # "superlist"
            # "appflowy"
            # "jan"
            # "ollama"
            # "morgen"
            # "adobe-creative-cloud"
            # "maccy"
            # "boom-3d"
            # "logseq"
            # "bartender"
            # "mindmac"
            # "firefox-developer-edition"
            # "google-chrome-dev"
            # "microsoft-edge"
            # "sunsama"
            # "reflect"
            # "swish"
            # "capacities"
            # "textsniper"
            # "mem"
            # "signal"
        ];
    };
}
