{ lib
, stdenvNoCC
, fetchFromGitHub
, makeWrapper
, python3
}:

stdenvNoCC.mkDerivation {
  pname = "apport-unpack";
  version = "0-unstable-2026-06-21";

  src = fetchFromGitHub {
    owner = "canonical";
    repo = "apport";
    rev = "07b90b3125aff8919843f69be7c7fc685bf554ed";
    sha256 = "1cqaj6xgy6w7f3f4npislw1sb3zh1rlfqbb0ha93zmr392086mj1";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/apport" "$out/bin"
    cp -r apport problem_report.py "$out/share/apport/"
    install -Dm755 bin/apport-unpack "$out/share/apport/bin/apport-unpack"

    makeWrapper ${python3}/bin/python3 "$out/bin/apport-unpack" \
      --add-flags "$out/share/apport/bin/apport-unpack" \
      --set PYTHONPATH "$out/share/apport"

    runHook postInstall
  '';

  meta = {
    description = "Extract fields from an Apport crash report";
    homepage = "https://github.com/canonical/apport";
    license = lib.licenses.gpl2Plus;
    mainProgram = "apport-unpack";
  };
}
