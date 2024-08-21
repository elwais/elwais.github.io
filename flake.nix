{
  description = "Basic nix flake to kickstart local development of jekyll-based
    websites, such as Techfolios or Morea";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      packages = [(pkgs.ruby.withPackages (ps: with ps; [jekyll webrick]) )];
        
      shellHook = ''
        bundle install
        bundle exec jekyll serve
      '';
    };
  };
}
