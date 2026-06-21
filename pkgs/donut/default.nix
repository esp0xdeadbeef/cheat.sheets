{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "donut";
  version = "0-unstable-2026-06-21";

  src = fetchFromGitHub {
    owner = "TheWover";
    repo = "donut";
    rev = "47758d787209dd1744f58c140102ac91b649df16";
    sha256 = "069y37z7n58yfb59r9lx60k1v6lw2v81yw0pc42bxymn1agbp9l0";
  };

  buildPhase = ''
    runHook preBuild
    make donut
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -Dm755 donut "$out/bin/donut"
    runHook postInstall
  '';

  meta = {
    description = "Generates x86, x64, or AMD64+x86 position-independent shellcode";
    homepage = "https://github.com/TheWover/donut";
    license = lib.licenses.bsd3;
    mainProgram = "donut";
  };
}
