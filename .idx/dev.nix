# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.python312
    pkgs.python312Packages.pip
    pkgs.python312Packages.pipx
    pkgs.gcc
    pkgs.stdenv.cc.cc.lib
  ];
  
  
  # Sets environment variables in the workspace
  env = {
        GEMINI_API_KEY="{YOUR API KEY}";
        LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
  };

  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
      "ms-vscode.live-server"
      "saoudrizwan.claude-dev"
    ];

    previews = {
      enable = true;
      previews = {
        # web = {
        #   command = ["python3" "-m" "http.server" "$PORT"];
        #   manager = "web";
        # };
        web = {
          command = [
            "npm"
            "run"
            "start"
            "--"
            "--port"
            "$PORT"
            "--host"
            "0.0.0.0"
            "--disable-host-check"
          ];
          manager = "web";
        };
        # The following object sets Android previews
        # Note that this is supported only on FLutter workspaces
        android = {
          manager = "flutter";
        };        
      };
    };
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
        install-aider-chat = "pipx install aider-chat";
        # run-aider-chat = "pipx run aider-chat";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [ ".idx/dev.nix" "README.md" ];
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
        install-aider-chat = "pipx install aider-chat";
        # run-aider-chat = "pipx run aider-chat";
      };
    };
  };
}
