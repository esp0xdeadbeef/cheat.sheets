{ lib
, python311
, uv
, writeShellApplication
}:

writeShellApplication {
  name = "droopescan";
  runtimeInputs = [
    python311
    uv
  ];

  text = ''
    exec uvx --python ${python311}/bin/python3.11 --from droopescan droopescan "$@"
  '';

  meta = {
    description = "Plugin-based scanner for CMS vulnerabilities";
    homepage = "https://github.com/droope/droopescan";
    license = lib.licenses.gpl2Only;
    mainProgram = "droopescan";
  };
}
