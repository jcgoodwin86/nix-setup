({ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.05";
  # specify my home-manager configs
  home.packages = with pkgs; [
    bat
    eza
    fd
    procs
    sd
    du-dust
    ripgrep
    lazygit
    nixpkgs-fmt
  ];
  home.sessionPath = [
    "/opt/homebrew/sbin"
    "$HOME/.cargo/bin"
    "/opt/homebrew/opt/openjdk/bin"
    "/Users/joe/.local/bin"
    "$HOME/go/bin"
    "$HOME/Projects/screenpipe/target/release"
  ];
  # programs.fish = {
  #   enable = true;
  #   shellAliases = {
  #     ll = "eza --color auto --icons -lF ";
  #     la = "eza --color auto --icons -laF ";
  #     ba = "brew update && brew upgrade && brew doctor";
  #   };
  # };
  # Home Manager is only able to set session variables automatically if it manages your Bash, Z shell, or fish shell configuration.
  programs.zsh.enable = true;
  # programs.zsh.localVariables = {
  #     CPPFLAGS = "-I/opt/homebrew/opt/openjdk/include";
  # };
  programs.zsh.antidote.enable = true;
  programs.zsh.antidote.plugins = with pkgs; [
    "zsh-users/zsh-autosuggestions"
    "zsh-users/zsh-completions"
    "zsh-users/zsh-history-substring-search"
    "zsh-users/zsh-syntax-highlighting"
  ];
  programs.zsh.enableCompletion = true;
  programs.zsh.completionInit = ''
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
  '';
  programs.zsh.initExtra = ''
    ${builtins.readFile ./custom.zsh}
    
    # Case insensitive completion and globbing
    setopt NO_CASE_GLOB
    setopt NO_CASE_MATCH
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
  '';
  programs.zsh.shellAliases = {
    ll = "eza --color auto --icons -lF ";
    la = "eza --color auto --icons -laF ";
    ba = "brew update && brew upgrade && brew doctor";
  };
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  # programs.starship.enableFishIntegration = true;
  programs.git = {
    enable = true;
    userName = "jcgoodwin86";
    userEmail = "jcgoodwin86@users.noreply.github.com";
    aliases = {
      db = "!f() { git branch -d $1 && git push origin --delete $1; }; f";
    };
    extraConfig = {
      "init" = {
        "defaultBranch" = "main";
      };
    };
  };
  programs.vscode = {
    enable = true;
    # mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      christian-kohler.path-intellisense
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      formulahendry.auto-rename-tag
      ritwickdey.liveserver
      streetsidesoftware.code-spell-checker
      gruntfuggly.todo-tree
      vscodevim.vim
      github.copilot
      github.copilot-chat
      svelte.svelte-vscode
    ];
    userSettings = {
      "editor.accessibilitySupport" = "off";
      "editor.inlineSuggest.enabled" = true;
      "[astro]" = {
        # "editor.defaultFormatter"= "astro-build.astro-vscode";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[svelte]" = {
        "editor.defaultFormatter" = "svelte.svelte-vscode";
      };
      "[javascriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[css]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "editor.fontSize" = 16;
      "editor.fontFamily" = "'JetBrainsMono Nerd Font Mono',Menlo, Monaco, 'Courier New', monospace";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "eslint.validate" = [
        "javascript"
        "javascriptreact"
        "astro" # Enable .astro
        "typescript" # Enable .ts
        "typescriptreact" # Enable .tsx
      ];
      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
      };
      "[html]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "terminal.integrated.env.osx" = { };
      "files.autoSave" = "onFocusChange";
      "svelte.enable-ts-plugin" = true;
      # "gitlens.ai.experimental.model"= "openai:gpt-4o";
      # "console-ninja.featureSet" = "Community";
      # "window.autoDetectColorScheme"= true;
      # "workbench.preferredDarkColorTheme"= "Default High Contrast";
      "workbench.colorTheme" = "Dracula Pro";
    };
  };
})
