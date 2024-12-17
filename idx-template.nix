# No user-configurable parameters
{ pkgs, ... }: {
  packages = [
    # Enable "node", "npm" and "npx" in the bootstrap script below.
    # Note, this is NOT the list of packages available to the workspace once
    # it's created. Those go in .idx/dev.nix
    pkgs.nodejs_20
    # pkgs.nodejs
  ];

# Shell script that produces the final environment
  bootstrap = ''
    cp -rf ${./.} "$out"
    chmod -R +w "$out"
    rm -rf "$out/.git" "$out/idx-template".{nix,json}
    npm i sv
    npx sv create "$out" --template minimal --types ts --no-add-ons --no-install
    cd "$out"
    npx sv add prettier eslint tailwind --tailwindcss none --sveltekit-adapter vercel   
    # npm install
    # git init && git add -A && git commit -m "Initial commit"
  '';
}
