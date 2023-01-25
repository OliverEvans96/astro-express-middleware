{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        deps = with pkgs; [ nodejs ];
        nodeDeps = with pkgs.nodePackages; [ yarn ];
        allDeps = deps ++ nodeDeps;
      in rec {
        packages.default = pkgs.hello;
        defaultPackage = packages.default;

        devShell = pkgs.mkShell {
          name = "astro-nix-shell";
          src = ./.;

          # build-time deps
          nativeBuildInputs = allDeps;
        };
      });
}
