# No user-configurable parameters
{ pkgs, ... }: {
  packages = [
    # Enable "node", "npm" and "npx" in the bootstrap script below.
    # Note, this is NOT the list of packages available to the workspace once
    # it's created. Those go in .idx/dev.nix
    pkgs.nodejs_20
    # pkgs.nodejs
  ];

  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "ms-vscode.live-server"
      "svelte.svelte-vscode"
      "saoudrizwan.claude-dev"
      "Blackboxapp.blackbox"
    ];

    previews = {
      enable = true;
      previews = {
        web = {
          command = ["npm" "run" "dev" "--" "--port" "$PORT" "--host" "0.0.0.0"];
          manager = "web";
        };
      };
    };

    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        npm-install = "npm install";
        # Open editors for the following files by default, if they exist:
        # default.openFiles = [ ".idx/dev.nix" "README.md" ];
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
      };
    };
  };

# Shell script that produces the final environment
  bootstrap = ''
    npm i sv
    npx sv create "$out" --template minimal --types ts --no-add-ons --no-install
    cd "$out"
    npx sv add prettier eslint tailwind --tailwindcss none --sveltekit-adapter vercel   
    # npm install
    # git init && git add -A && git commit -m "Initial commit"
  '';
}
