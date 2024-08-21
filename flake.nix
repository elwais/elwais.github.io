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
        
      shellHook = ''  # `nix develop` and <C-c> is all you need to start and stop
        bundle install
        bundle exec jekyll serve
        exit
      '';
    };
  };
}
