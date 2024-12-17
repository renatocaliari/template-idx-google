# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs
    # pkgs.python312
    # pkgs.python312Packages.pip
    # pkgs.python312Packages.pipx
    # pkgs.gcc
    # pkgs.stdenv.cc.cc.lib
  ];
  
  
  # Sets environment variables in the workspace
  # env = {
        # GEMINI_API_KEY="{YOUR API KEY}";
        # LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
  # };

  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
      "saoudrizwan.claude-dev"
      "Blackboxapp.blackbox"
      "svelte.svelte-vscode"
    ];

    previews = {
      enable = true;
      previews = {
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
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        npm-install = "npm install";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [ "README.md" ];
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
      };
    };
  };
}
