# No user-configurable parameters
{ pkgs, ... }: {
  packages = [
    # Enable "node", "npm" and "npx" in the bootstrap script below.
    # Note, this is NOT the list of packages available to the workspace once
    # it's created. Those go in .idx/dev.nix
    pkgs.nodejs
  ];

# Shell script that produces the final environment
  bootstrap = ''
    npm i sv
    npx sv create "$out" --template minimal --types ts --no-add-ons --no-install
    cd "$out"
    npx sv add prettier eslint tailwind --tailwindcss none --sveltekit-adaptar vercel   
    npm install
    git init && git add -A && git commit -m "Initial commit"

    # Copy the folder containing the `idx-template` files to the final
    # project folder for the new workspace. ${./.} inserts the directory
    # of the checked-out Git folder containing this template.
    # cp -rf ${./.} "$out"

    # Set some permissions
    # chmod -R +w "$out"

    # Remove the template files themselves and any connection to the template's
    # Git repository
    # rm -rf "$out/.git" "$out/idx-template".{nix,json}
  '';
}
