pkgs: {
  apport = pkgs.callPackage ./apport { };
  donut = pkgs.callPackage ./donut { };
  droopescan = pkgs.callPackage ./droopescan { };
  patator = pkgs.callPackage ./patator { };
}
