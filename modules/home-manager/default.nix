({pkgs, ...}: {
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
        #speedtest-cli
        #trashy
        #vscode
        lazygit
    ];
    home.sessionPath = [
        "/opt/homebrew/sbin"
        "$HOME/.cargo/bin"
        "/opt/homebrew/opt/openjdk/bin"
        "/Users/joe/.local/bin"
        "$HOME/go/bin"
    ];
    # Home Manager is only able to set session variables automatically if it manages your Bash, Z shell, or fish shell configuration.
    programs.zsh.enable = true;
    # programs.zsh.localVariables = {
    #     CPPFLAGS = "-I/opt/homebrew/opt/openjdk/include";
    # };
    programs.zsh.shellAliases = {
        ll = "eza --color auto --icons -lF ";
        la = "eza --color auto --icons -laF ";
        ba = "brew update && brew upgrade && brew doctor";
        };
    programs.git = {
        enable = true;
        userName = "jcgoodwin86";
        userEmail = "jcgoodwin86@users.noreply.github.com";
        aliases = {
            db =  "!f() { git branch -d $1 && git push origin --delete $1; }; f";
        };
        extraConfig ={
            "init" = {
                "defaultBranch" = "main";
            };
        };
    };
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            dracula-theme.theme-dracula
            bbenoist.nix
            christian-kohler.path-intellisense
            dbaeumer.vscode-eslint
            eamodio.gitlens
            esbenp.prettier-vscode
            formulahendry.auto-rename-tag
            ritwickdey.liveserver
            streetsidesoftware.code-spell-checker
            gruntfuggly.todo-tree
            vscodevim.vim
            equinusocio.vsc-material-theme
  ];
        userSettings = {
            "editor.accessibilitySupport" = "off";
            "editor.inlineSuggest.enabled" = true;
            "workbench.colorTheme" = "Material Theme Palenight High Contrast";
            "[astro]"= {
                # "editor.defaultFormatter"= "astro-build.astro-vscode";
                "editor.defaultFormatter"= "esbenp.prettier-vscode";
            };
            "[javascript]"= {
                "editor.defaultFormatter"= "esbenp.prettier-vscode";
            };
            "[javascriptreact]"= {
                "editor.defaultFormatter"= "esbenp.prettier-vscode";
            };
            "[css]"= {
                "editor.defaultFormatter"= "esbenp.prettier-vscode";
            };
            "editor.fontSize"= 16;
            "editor.fontFamily"=  "'JetBrainsMono Nerd Font Mono',Menlo, Monaco, 'Courier New', monospace";
            "editor.fontLigatures"= true;
            "editor.formatOnSave"= true;
            "eslint.validate"= [
                "javascript"
                "javascriptreact"
                "astro" # Enable .astro
                #"typescript" # Enable .ts
                #"typescriptreact" # Enable .tsx
            ];
            "gitlens.ai.experimental.model"= "openai:gpt-4o";
            "[python]"= {
                "editor.defaultFormatter"= "ms-python.black-formatter";
            };
        };
};
})
