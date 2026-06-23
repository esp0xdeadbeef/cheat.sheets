pkgs: {
  apport = pkgs.callPackage ./apport { };
  burpsuite = pkgs.burpsuite.override { iconName = "community"; };
  burpsuite-community = pkgs.burpsuite.override { iconName = "community"; };
  burpsuite-pro = pkgs.burpsuite.override { iconName = "pro"; };
  donut = pkgs.callPackage ./donut { };
  droopescan = pkgs.callPackage ./droopescan { };
  patator = pkgs.callPackage ./patator { };
}
